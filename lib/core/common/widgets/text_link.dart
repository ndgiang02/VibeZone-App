import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// "Don't have an account? **Sign up**" style text with a tappable action.
class TextLink extends StatefulWidget {
  final String text;
  final String action;
  final VoidCallback onTap;

  const TextLink({
    super.key,
    required this.text,
    required this.action,
    required this.onTap,
  });

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  late final _recognizer = TapGestureRecognizer()..onTap = () => widget.onTap();

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    return Text.rich(
      TextSpan(
        text: widget.text,
        style: style,
        children: [
          TextSpan(
            text: widget.action,
            style: style?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: _recognizer,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
