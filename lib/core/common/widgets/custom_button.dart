import 'package:flutter/material.dart';
import 'package:vibezone/core/configs/constants/constant.dart';
import 'package:vibezone/core/utils/responsive.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback action;
  final bool showBorder;
  final FontWeight fontWeight;
  final double sizeText;
  final bool enable;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    required this.action,
    required this.backgroundColor,
    required this.textColor,
    required this.showBorder,
    required this.fontWeight,
    required this.sizeText,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.clampWidth(60, context, min: 200, max: 360),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          backgroundColor: backgroundColor,
          side: showBorder
              ? BorderSide(color: primary, width: 3)
              : BorderSide.none,
        ),
        onPressed: () => enable ? action.call() : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, SizedBox(width: 8)],
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: sizeText,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
