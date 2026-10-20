import 'package:flutter/material.dart';

/// Shows a two-button dialog and resolves to `true` when confirmed.
Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmText,
  required String cancelText,
  bool isDestructive = false,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(cancelText),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: isDestructive
              ? FilledButton.styleFrom(
                  backgroundColor: Theme.of(ctx).colorScheme.error,
                )
              : null,
          child: Text(confirmText),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}
