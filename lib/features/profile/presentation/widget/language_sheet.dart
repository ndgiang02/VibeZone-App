import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/utils/data_utils.dart';
import 'package:vibezone/features/auth/data/models/language/language.dart';

/// Resolves to the picked language, or `null` when dismissed.
Future<Language?> showLanguageSheet(
  BuildContext context, {
  required String? selectedName,
}) {
  return showModalBottomSheet<Language>(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: Text(
              S.of(ctx).title_select_language,
              style: Theme.of(ctx).textTheme.titleMedium,
            ),
          ),
          for (final language in languages)
            ListTile(
              title: Text(language.name),
              trailing: language.name == selectedName
                  ? Icon(
                      Icons.check_circle_rounded,
                      color: Theme.of(ctx).colorScheme.primary,
                    )
                  : null,
              onTap: () => Navigator.pop(ctx, language),
            ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
