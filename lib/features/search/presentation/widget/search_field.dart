import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  const SearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: TextStyle(color: scheme.onSurface),
      decoration: InputDecoration(
        hintText: S.of(context).hint_search,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        prefixIcon: SvgWidget(
          ic: icSearch,
          width: 20,
          height: 20,
          color: scheme.onSurfaceVariant,
        ),
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, _) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
        ),
      ),
    );
  }
}
