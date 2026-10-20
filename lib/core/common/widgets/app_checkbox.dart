import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/core/utils/responsive.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget label;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            firstChild: SvgPicture.asset(icChecked, width: 20, height: 20),
            secondChild: SvgPicture.asset(icUnChecked, width: 20, height: 20),
            crossFadeState: value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          const SizedBox(width: Spacing.x3),
          Flexible(child: label),
        ],
      ),
    );
  }
}
