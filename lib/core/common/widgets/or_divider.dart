import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Expanded(child: Divider()),
        const SizedBox(width: 12),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: 12),
        const Expanded(child: Divider()),
        const SizedBox(width: 20),
      ],
    );
  }
}
