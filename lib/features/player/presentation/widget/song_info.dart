import 'package:flutter/material.dart';

class SongInfo extends StatelessWidget {
  final String? title;
  final String? artist;
  const SongInfo({super.key, this.title, this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? 'Không có tên bài hát',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          artist ?? 'Không có tên nghệ sĩ',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.white70),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
