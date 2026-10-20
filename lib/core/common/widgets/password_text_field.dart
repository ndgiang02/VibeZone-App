import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';

/// [CustomTextField] preconfigured for passwords, with its own show/hide
/// toggle so screens don't have to keep that state.
class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final String? error;
  final ValueChanged<String> onChanged;
  final TextInputAction? textInputAction;

  const PasswordTextField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.error,
    this.textInputAction,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: widget.hintText,
      obscureText: _obscure,
      error: widget.error,
      textInputAction: widget.textInputAction,
      prefixWidget: const SvgWidget(ic: icPassword),
      icon: _obscure ? Icons.visibility : Icons.visibility_off,
      actionRight: () => setState(() => _obscure = !_obscure),
      onChanged: widget.onChanged,
    );
  }
}
