import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/song_tile.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/utils/format_utils.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/features/player/presentation/bloc/play_bloc.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/presentation/widget/period_tabs.dart';
import 'package:vibezone/features/trending/presentation/widget/rank_change.dart';
import 'package:vibezone/features/trending/presentation/widget/trending_podium.dart';
import 'package:vibezone/injection.dart';

import 'bloc/trending_bloc.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TrendingBloc>()..add(const TrendingEvent.started()),
      child: const _TrendingView(),
    );
  }
}

class _TrendingView extends StatelessWidget {
  const _TrendingView();

  void _play(BuildContext context, TrendingSong item, List<TrendingSong> all) {
    context.read<PlayBloc>().add(
      PlayEvent.playSong(
        song: item.song,
        queue: all.map((e) => e.song).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final activeId = context.select((PlayBloc bloc) => bloc.state.song?.id);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    Responsive.horizontalPadding(context),
                    16,
                    Responsive.horizontalPadding(context),
                    0,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 180),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).title_trending,
                                    style: theme.textTheme.displaySmall,
                                  ),
                                  Text(
                                    S.of(context).txt_trending_subtitle,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            /*FilledButton.icon(
                              onPressed: state.songs.isEmpty
                                  ? null
                                  : () => _play(
                                      context,
                                      state.songs.first,
                                      state.songs,
                                    ),
                              icon: const Icon(Icons.play_arrow_rounded),
                              label: Text(S.of(context).btn_play_all),
                              style: FilledButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                            ),*/
                          ],
                        ),
                        const SizedBox(height: Spacing.x4),
                        PeriodTabs(
                          selected: state.period,
                          onChanged: (period) => context
                              .read<TrendingBloc>()
                              .add(TrendingEvent.changePeriod(period)),
                        ),
                        const SizedBox(height: Spacing.x5),
                      ],
                    ),
                  ),
                ),
                ..._buildContent(context, state, activeId),
                SliverToBoxAdapter(child: SizedBox(height: bottomInset + 16)),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildContent(
    BuildContext context,
    TrendingState state,
    String? activeId,
  ) {
    if (state.status == PageState.loading || state.status == PageState.init) {
      return const [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }
    if (state.status == PageState.error) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.errorMessage ??
                      S.of(context).err_an_error_occurred_please_check_again,
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => context.read<TrendingBloc>().add(
                    const TrendingEvent.started(),
                  ),
                  child: Text(S.of(context).btn_retry),
                ),
              ],
            ),
          ),
        ),
      ];
    }

    return [
      SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context, min: 0),
        ),
        sliver: SliverToBoxAdapter(
          child: TrendingPodium(
            topThree: state.topThree,
            onTap: (item) => _play(context, item, state.songs),
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: Spacing.x5)),
      SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context),
        ),
        sliver: SliverList.builder(
          itemCount: state.others.length,
          itemBuilder: (context, index) {
            final item = state.others[index];
            return SongTile(
              song: item.song,
              isActive: item.song.id == activeId,
              subtitle:
                  '${item.song.artist} • ${FormatUtils.compact(item.song.plays)} ${S.of(context).txt_plays}',
              leading: SizedBox(
                width: 32,
                child: Column(
                  children: [
                    Text(
                      '${item.rank}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RankChange(item: item),
                  ],
                ),
              ),
              onTap: () => _play(context, item, state.songs),
            );
          },
        ),
      ),
    ];
  }
}
