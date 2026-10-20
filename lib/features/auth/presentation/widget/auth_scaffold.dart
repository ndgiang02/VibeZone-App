import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/max_width_box.dart';
import 'package:vibezone/core/utils/responsive.dart';

/// Shared layout for auth screens: back button + scrollable padded column.
class AuthScaffold extends StatelessWidget {
  final List<Widget> children;

  const AuthScaffold({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: MaxWidthBox(
              maxWidth: Breakpoints.form,
              child: Column(children: children),
            ),
          ),
        ),
      ),
    );
  }
}
