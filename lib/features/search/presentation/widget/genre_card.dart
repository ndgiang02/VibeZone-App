import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  final int index;
  final VoidCallback onTap;

  const GenreCard({
    super.key,
    required this.genre,
    required this.index,
    required this.onTap,
  });

  static const _palette = [
    [Color(0xFFA8D64A), Color(0xFF3FA36B)],
    [Color(0xFFFF7A59), Color(0xFFD7263D)],
    [Color(0xFF7F7FD5), Color(0xFF5B4BDB)],
    [Color(0xFFF7B733), Color(0xFFFC4A1A)],
    [Color(0xFF43C6AC), Color(0xFF191654)],
    [Color(0xFFEC77AB), Color(0xFF7873F5)],
    [Color(0xFF00C6FF), Color(0xFF0072FF)],
    [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
  ];

  @override
  Widget build(BuildContext context) {
    final colors = _palette[index % _palette.length];
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -14,
              child: Transform.rotate(
                angle: 0.4,
                child: Icon(
                  Icons.music_note_rounded,
                  size: 72,
                  color: Colors.white.withValues(alpha: 0.25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                genre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
