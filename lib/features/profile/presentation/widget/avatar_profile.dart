import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';

class AvatarProfile extends StatelessWidget {
  final String url;
  final double size;
  final VoidCallback? onChangeAvatar;

  const AvatarProfile({
    super.key,
    required this.url,
    this.size = 104,
    this.onChangeAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onChangeAvatar,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [scheme.primary, const Color(0xFF3FA36B)],
              ),
            ),
            child: AppImage(
              url: url,
              width: size,
              height: size,
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: scheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: scheme.surface, width: 2),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
