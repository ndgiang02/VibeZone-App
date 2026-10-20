import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final error = Theme.of(context).colorScheme.error;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.logout_rounded),
        label: Text(S.of(context).label_menu_log_out),
        style: OutlinedButton.styleFrom(
          foregroundColor: error,
          side: BorderSide(color: error.withValues(alpha: 0.6)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}
