import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/horizontal_scroll_row.dart';
import 'package:vibezone/core/common/widgets/song_tile.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/features/home/presentation/widget/artist_widget.dart';
import 'package:vibezone/features/home/presentation/widget/featured_banner.dart';
import 'package:vibezone/features/home/presentation/widget/genre_chips.dart';
import 'package:vibezone/features/home/presentation/widget/home_header.dart';
import 'package:vibezone/features/home/presentation/widget/home_loading.dart';
import 'package:vibezone/features/home/presentation/widget/playlist_widget.dart';
import 'package:vibezone/features/home/presentation/widget/section_header.dart';
import 'package:vibezone/features/home/presentation/widget/song_widget.dart';
import 'package:vibezone/features/home/presentation/widget/trending_teaser.dart';
import 'package:vibezone/features/main/presentation/bloc/main_bloc.dart';
import 'package:vibezone/features/player/presentation/bloc/play_bloc.dart';
import 'package:vibezone/injection.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  void _play(BuildContext context, Song song, List<Song> queue) {
    context.read<PlayBloc>().add(PlayEvent.playSong(song: song, queue: queue));
  }

  void _goToTab(BuildContext context, int index) {
    context.read<MainBloc>().add(MainEvent.onChangePage(index));
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final activeId = context.select((PlayBloc bloc) => bloc.state.song?.id);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final data = state.data;
            return RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<HomeBloc>()
                  ..add(const HomeEvent.refresh());
                await bloc.stream.firstWhere(
                  (s) => s.status != PageState.refreshing,
                );
              },
              child: ListView(
                // Content is capped and centered on tablets.
                padding: EdgeInsets.fromLTRB(
                  Responsive.horizontalPadding(context),
                  Spacing.x4,
                  Responsive.horizontalPadding(context),
                  bottomInset + Spacing.x5,
                ),
                children: [
                  HomeHeader(
                    username: SessionController().user.username,
                    onSearchTap: () => _goToTab(context, 2),
                  ),
                  const SizedBox(height: Spacing.x5),
                  if (state.status == PageState.error && data == null)
                    _HomeError(
                      message: state.errorMessage,
                      onRetry: () => context.read<HomeBloc>().add(
                        const HomeEvent.started(),
                      ),
                    )
                  else if (data == null)
                    const HomeLoading()
                  else ...[
                    FeaturedBanner(
                      songs: data.featured,
                      onPlay: (song) => _play(context, song, data.featured),
                    ),
                    const SizedBox(height: Spacing.x5),
                    GenreChips(
                      genres: data.genres,
                      selected: state.selectedGenre,
                      onSelected: (genre) => context.read<HomeBloc>().add(
                        HomeEvent.selectGenre(genre),
                      ),
                    ),
                    const SizedBox(height: Spacing.x4),
                    SectionHeader(title: S.of(context).title_popular_songs),
                    const SizedBox(height: Spacing.x3),
                    _PopularSongs(
                      songs: state.popularSongs,
                      activeId: activeId,
                      onTap: (song) => _play(context, song, state.popularSongs),
                    ),
                    const SizedBox(height: Spacing.x5),
                    TrendingTeaser(onTap: () => _goToTab(context, 1)),
                    const SizedBox(height: Spacing.x5),
                    SectionHeader(title: S.of(context).title_playlists),
                    const SizedBox(height: Spacing.x3),
                    HorizontalScrollRow(
                      spacing: 16,
                      children: [
                        for (final playlist in data.playlists)
                          PlaylistCard(
                            playlist: playlist,
                            onTap: () => _play(
                              context,
                              playlist.songs.first,
                              playlist.songs,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: Spacing.x4),
                    SectionHeader(title: S.of(context).title_top_artists),
                    const SizedBox(height: Spacing.x3),
                    HorizontalScrollRow(
                      children: [
                        for (final artist in data.artists)
                          ArtistAvatar(artist: artist),
                      ],
                    ),
                    const SizedBox(height: Spacing.x4),
                    if (data.recentlyPlayed.isNotEmpty) ...[
                      SectionHeader(title: S.of(context).title_recently_played),
                      for (final song in data.recentlyPlayed)
                        SongTile(
                          song: song,
                          isActive: song.id == activeId,
                          onTap: () =>
                              _play(context, song, data.recentlyPlayed),
                        ),
                    ],
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PopularSongs extends StatelessWidget {
  final List<Song> songs;
  final String? activeId;
  final ValueChanged<Song> onTap;

  const _PopularSongs({
    required this.songs,
    required this.activeId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(child: Text(S.of(context).txt_no_results)),
      );
    }
    return HorizontalScrollRow(
      children: [
        for (final song in songs)
          SongCard(
            song: song,
            isActive: song.id == activeId,
            onTap: () => onTap(song),
          ),
      ],
    );
  }
}

class _HomeError extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const _HomeError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          const Icon(Icons.wifi_off_rounded, size: 48),
          const SizedBox(height: 12),
          Text(
            message ?? S.of(context).err_an_error_occurred_please_check_again,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: onRetry,
            child: Text(S.of(context).btn_retry),
          ),
        ],
      ),
    );
  }
}
