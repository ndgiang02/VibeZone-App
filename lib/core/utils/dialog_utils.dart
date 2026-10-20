import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/loading.dart';
import 'package:vibezone/main.dart';

class DialogUtils {
  static void loading() {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentState!.context,
      builder: (_) => Loading(),
    );
  }

  static void hideLoading() {
    Navigator.pop(navigatorKey.currentState!.context);
  }
}
