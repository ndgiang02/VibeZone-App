import 'package:flutter/material.dart';

class SnackBarUtils {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    final scheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: isError ? Colors.white : Colors.black),
          ),
          backgroundColor: isError ? scheme.error : scheme.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }
}
