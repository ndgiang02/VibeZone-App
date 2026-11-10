import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/confirm_dialog.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/core/utils/error_message.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/main/presentation/bloc/main_bloc.dart';
import 'package:vibezone/features/miniplayer/presentation/cubit/miniplayer_cubit.dart';
import 'package:vibezone/features/player/presentation/bloc/play_bloc.dart';
import 'package:vibezone/features/profile/presentation/widget/avatar_sheet.dart';
import 'package:vibezone/features/profile/presentation/widget/logout_button.dart';
import 'package:vibezone/features/profile/presentation/widget/profile_header.dart';
import 'package:vibezone/features/profile/presentation/widget/profile_menu.dart';
import 'package:vibezone/injection.dart';

import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => getIt<ProfileBloc>()..add(ProfileEvent.onInit()),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  Future<void> _confirmLogout(BuildContext context) async {
    final s = S.of(context);
    final confirmed = await showConfirmDialog(
      context,
      title: s.label_menu_log_out,
      message: s.mgs_logout_confirm,
      confirmText: s.label_menu_log_out,
      cancelText: s.txt_cancel,
      isDestructive: true,
    );
    if (confirmed && context.mounted) {
      context.read<ProfileBloc>().add(const ProfileEvent.onLogout());
    }
  }

  void _onPageCommand(BuildContext context, PageCommand? command) {
    if (command is PageCommandNavigatorPage && command.page == '/login') {
      context.read<PlayBloc>().add(const PlayEvent.stop());
      context.read<MiniPlayerCubit>().expand();
      context.read<MainBloc>().add(const MainEvent.onChangePage(0));
      context.go('/login');
    } else if (command is PageCommandShowError) {
      SnackBarUtils.show(
        context,
        errorMessage(context, command.msg),
        isError: true,
      );
    } else if (command is PageCommandShowSuccess) {
      final s = S.of(context);
      SnackBarUtils.show(
        context,
        command.msg == ProfileBloc.msgAvatarUpdated
            ? s.msg_avatar_updated
            : s.msg_profile_updated,
      );
    }
  }

  Future<void> _changeAvatar(BuildContext context) async {
    final bloc = context.read<ProfileBloc>();
    final action = await showAvatarSheet(
      context,
      hasAvatar: bloc.state.user?.avatar != null,
    );
    switch (action) {
      case AvatarPicked(:final path):
        bloc.add(ProfileEvent.onChangeAvatar(File(path)));
      case AvatarRemoved():
        bloc.add(const ProfileEvent.onRemoveAvatar());
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (p, c) => p.pageCommand != c.pageCommand,
      listener: (context, state) => _onPageCommand(context, state.pageCommand),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).title_profile),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              Responsive.horizontalPadding(context),
              Spacing.x3,
              Responsive.horizontalPadding(context),
              MediaQuery.paddingOf(context).bottom + Spacing.x4,
            ),
            children: [
              BlocSelector<ProfileBloc, ProfileState, UserModel?>(
                selector: (state) => state.user,
                builder: (context, user) => ProfileHeader(
                  user: user ?? SessionController().user,
                  onChangeAvatar: () => _changeAvatar(context),
                ),
              ),
              const SizedBox(height: Spacing.x6),
              const ProfileMenu(),
              LogoutButton(onPressed: () => _confirmLogout(context)),
              const SizedBox(height: Spacing.x4),
              Center(
                child: Text(
                  '${S.of(context).txt_version} 1.0.0',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
