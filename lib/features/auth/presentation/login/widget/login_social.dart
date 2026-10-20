import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibezone/core/configs/constants/assets.dart';

class SignUpOrSignInSocial extends StatelessWidget {
  final VoidCallback onPressedFaceBook;
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedApple;

  const SignUpOrSignInSocial({
    super.key,
    required this.onPressedFaceBook,
    required this.onPressedGoogle,
    required this.onPressedApple,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        OutlinedButton(
          onPressed: () => onPressedFaceBook.call(),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          child: SvgPicture.asset(facebook_svg),
        ),
        OutlinedButton(
          onPressed: () => onPressedGoogle.call(),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          child: SvgPicture.asset(google_svg),
        ),
        if (Platform.isIOS)
          OutlinedButton(
            onPressed: () => onPressedApple.call(),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
            child: SvgPicture.asset(apple_svg),
          ),
      ],
    );
  }
}
