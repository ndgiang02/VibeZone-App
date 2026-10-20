import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Renders either a bundled asset or a network image, with a shared
/// placeholder so screens don't need to care where artwork comes from.
class AppImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final Widget image = url.startsWith('http')
        ? CachedNetworkImage(
            imageUrl: url,
            width: width,
            height: height,
            fit: fit,
            fadeInDuration: const Duration(milliseconds: 200),
            placeholder: (context, _) => _placeholder(context),
            errorWidget: (context, _, _) => _placeholder(context),
          )
        : Image.asset(
            url,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, _, _) => _placeholder(context),
          );

    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }

  Widget _placeholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Icon(
        Icons.music_note_rounded,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
