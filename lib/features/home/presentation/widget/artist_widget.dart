import 'package:flutter/material.dart';
import 'package:vibezone/core/common/entities/artist.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/format_utils.dart';
import 'package:vibezone/core/utils/responsive.dart';

class ArtistAvatar extends StatelessWidget {
  final Artist artist;

  const ArtistAvatar({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = Responsive.clampWidth(22, context, min: 76, max: 110);
    final avatarSize = width - 12;
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.primary, width: 2),
            ),
            child: AppImage(
              url: artist.imageUrl,
              width: avatarSize,
              height: avatarSize,
              borderRadius: BorderRadius.circular(avatarSize / 2),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            artist.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge,
          ),
          Text(
            '${FormatUtils.compact(artist.followers)} ${S.of(context).txt_followers}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
