import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/horizontal_scroll_row.dart';

class GenreChips extends StatelessWidget {
  final List<String> genres;

  /// `null` means "All".
  final String? selected;
  final ValueChanged<String?> onSelected;

  const GenreChips({
    super.key,
    required this.genres,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollRow(
      spacing: 8,
      children: [
        for (final genre in <String?>[null, ...genres])
          _GenreChip(
            label: genre ?? S.of(context).genre_all,
            isSelected: genre == selected,
            onTap: () => onSelected(genre),
          ),
      ],
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenreChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? scheme.primary : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : scheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
