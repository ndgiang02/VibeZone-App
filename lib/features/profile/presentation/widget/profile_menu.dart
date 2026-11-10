import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/routing/routes_const.dart';
import 'package:vibezone/core/state/cubit/app_cubit.dart';
import 'package:vibezone/core/utils/responsive.dart';

import '../bloc/profile_bloc.dart';
import 'edit_profile_sheet.dart';
import 'language_sheet.dart';
import 'menu_item.dart';
import 'menu_section.dart';
import 'menu_type.dart';

/// All settings sections, each rendered as a [MenuSectionCard].
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  Future<void> _onTap(BuildContext context, MenuType item) async {
    switch (item) {
      case MenuType.darkMode:
        _toggleDarkMode(context);
      case MenuType.language:
        final bloc = context.read<ProfileBloc>();
        final appCubit = context.read<AppCubit>();
        final language = await showLanguageSheet(
          context,
          selectedName: bloc.state.languageName,
        );
        if (language == null) return;
        final parts = language.code.split('_');
        appCubit.changeLocale(Locale(parts.first, parts.last));
        bloc.add(ProfileEvent.onChangeLanguage(language));
      case MenuType.editProfile:
        final bloc = context.read<ProfileBloc>();
        final name = await showEditProfileSheet(
          context,
          displayName: bloc.state.user?.displayName ?? '',
        );
        if (name != null) bloc.add(ProfileEvent.onUpdateName(name));
      case MenuType.upload:
        context.push(uploadRoute);
      case MenuType.security:
        context.push(securityRoute);
      default:
        log('TODO: ${item.name}');
    }
  }

  void _toggleDarkMode(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    context.read<AppCubit>().changeThemeMode(!isDark);
  }

  Widget? _trailing(BuildContext context, MenuType item) {
    final theme = Theme.of(context);
    switch (item) {
      case MenuType.darkMode:
        return Switch.adaptive(
          value: theme.brightness == Brightness.dark,
          activeTrackColor: theme.colorScheme.primary,
          onChanged: (_) => _toggleDarkMode(context),
        );
      case MenuType.language:
        final name = context.select((ProfileBloc b) => b.state.languageName);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name ?? '', style: theme.textTheme.bodyMedium),
            Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final section in MenuSection.values) ...[
          MenuSectionCard(
            title: section.title(context),
            children: [
              for (final item in section.items)
                MenuItem(
                  title: item.name(context),
                  icLeft: item.ic,
                  trailing: _trailing(context, item),
                  onTap: () => _onTap(context, item),
                ),
            ],
          ),
          const SizedBox(height: Spacing.x5),
        ],
      ],
    );
  }
}
