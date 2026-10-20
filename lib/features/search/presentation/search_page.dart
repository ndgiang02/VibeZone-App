import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/song_tile.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/utils/format_utils.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/features/player/presentation/bloc/play_bloc.dart';
import 'package:vibezone/features/search/presentation/widget/genre_card.dart';
import 'package:vibezone/features/search/presentation/widget/search_field.dart';
import 'package:vibezone/injection.dart';

import 'bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchBloc>()..add(const SearchEvent.started()),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  SearchBloc get _bloc => context.read<SearchBloc>();

  void _searchFor(String query) {
    _controller.text = query;
    _focusNode.unfocus();
    _bloc.add(SearchEvent.submitted(query));
  }

  void _cancel() {
    _controller.clear();
    _focusNode.unfocus();
    _bloc.add(const SearchEvent.queryChanged(''));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            Responsive.horizontalPadding(context),
            16,
            Responsive.horizontalPadding(context),
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).tab_search,
                style: theme.textTheme.displaySmall,
              ),
              const SizedBox(height: Spacing.x4),
              BlocBuilder<SearchBloc, SearchState>(
                buildWhen: (p, c) => p.isSearching != c.isSearching,
                builder: (context, state) => Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged: (q) =>
                            _bloc.add(SearchEvent.queryChanged(q)),
                        onSubmitted: (q) => _bloc.add(SearchEvent.submitted(q)),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: state.isSearching
                          ? TextButton(
                              onPressed: _cancel,
                              child: Text(S.of(context).txt_cancel),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.x4),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.isSearching
                        ? _SearchResults(
                            key: const ValueKey('results'),
                            state: state,
                          )
                        : _Discover(
                            key: const ValueKey('discover'),
                            state: state,
                            onSearch: _searchFor,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Discover extends StatelessWidget {
  final SearchState state;
  final ValueChanged<String> onSearch;

  const _Discover({super.key, required this.state, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<SearchBloc>();
    final titleStyle = theme.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        if (state.recentSearches.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).title_recent_searches,
                    style: titleStyle,
                  ),
                ),
                TextButton(
                  onPressed: () => bloc.add(const SearchEvent.clearRecent()),
                  child: Text(S.of(context).btn_clear_all),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.recentSearches
                  .map(
                    (query) => InputChip(
                      avatar: const Icon(Icons.history_rounded, size: 18),
                      label: Text(query),
                      onPressed: () => onSearch(query),
                      onDeleted: () =>
                          bloc.add(SearchEvent.removeRecent(query)),
                      shape: const StadiumBorder(),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: Spacing.x5)),
        ],
        SliverToBoxAdapter(
          child: Text(S.of(context).title_browse_all, style: titleStyle),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: Spacing.x4)),
        SliverGrid.builder(
          // 2 columns on phones, more as the width grows.
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.7,
          ),
          itemCount: state.genres.length,
          itemBuilder: (context, index) => GenreCard(
            genre: state.genres[index],
            index: index,
            onTap: () => onSearch(state.genres[index]),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
        ),
      ],
    );
  }
}

class _SearchResults extends StatelessWidget {
  final SearchState state;

  const _SearchResults({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final activeId = context.select((PlayBloc bloc) => bloc.state.song?.id);
    switch (state.status) {
      case PageState.loading:
        return const Center(child: CircularProgressIndicator());
      case PageState.empty:
        return _Message(
          icon: Icons.search_off_rounded,
          title: S.of(context).txt_no_results,
          subtitle: S.of(context).txt_try_another_keyword,
        );
      case PageState.error:
        return _Message(
          icon: Icons.error_outline_rounded,
          title: S.of(context).err_an_error_occurred_please_check_again,
        );
      default:
        return ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            bottom: MediaQuery.paddingOf(context).bottom + 16,
          ),
          children: [
            Text(
              '${S.of(context).title_songs} (${state.results.length})',
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            for (final song in state.results)
              SongTile(
                song: song,
                isActive: song.id == activeId,
                subtitle:
                    '${song.artist} • ${song.genre} • ${FormatUtils.duration(song.duration)}',
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.read<PlayBloc>().add(
                    PlayEvent.playSong(song: song, queue: state.results),
                  );
                },
              ),
          ],
        );
    }
  }
}

class _Message extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _Message({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleMedium),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle!, style: theme.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}
