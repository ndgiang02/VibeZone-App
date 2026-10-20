import 'package:flutter/material.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/responsive.dart';

class FeaturedBanner extends StatefulWidget {
  final List<Song> songs;
  final ValueChanged<Song> onPlay;

  const FeaturedBanner({super.key, required this.songs, required this.onPlay});

  @override
  State<FeaturedBanner> createState() => _FeaturedBannerState();
}

class _FeaturedBannerState extends State<FeaturedBanner> {
  final _controller = PageController(viewportFraction: 0.92);
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Taller on big screens, and grows with the text scale so the title fits.
    final height =
        Responsive.clampWidth(46, context, min: 170, max: 260) +
        MediaQuery.textScalerOf(context).scale(16) -
        16;
    return Column(
      children: [
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: _controller,
            padEnds: false,
            itemCount: widget.songs.length,
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: _BannerCard(
                song: widget.songs[index],
                onPlay: () => widget.onPlay(widget.songs[index]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.songs.length, (index) {
            final isActive = index == _page;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive ? scheme.primary : scheme.outlineVariant,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final Song song;
  final VoidCallback onPlay;

  const _BannerCard({required this.song, required this.onPlay});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPlay,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(url: song.imageUrl),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.85),
                    Colors.black.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
            Padding(
              // Right padding keeps the text clear of the play button.
              padding: const EdgeInsets.fromLTRB(16, 16, 72, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      S.of(context).txt_featured,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: Text(
                      song.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Material(
                color: scheme.primary,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onPlay,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.play_arrow_rounded, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
