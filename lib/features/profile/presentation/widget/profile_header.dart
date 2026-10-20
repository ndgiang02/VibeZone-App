import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/brand_name.dart';
import 'package:vibezone/core/configs/constants/assets.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';

import 'avatar_profile.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final memberSince = DateFormat.yMMM(
      Localizations.localeOf(context).languageCode,
    ).format(user.createdAt);
    return Column(
      children: [
        AvatarProfile(url: user.avatarUrl ?? avatar),
        const SizedBox(height: 16),
        if (user.username.isEmpty)
          BrandName(fontSize: theme.textTheme.titleLarge!.fontSize!)
        else
          Text(
            user.username,
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 4),
        Text(user.email, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${S.of(context).txt_member_since} $memberSince',
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
