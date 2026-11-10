import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/confirm_dialog.dart';
import 'package:vibezone/core/common/widgets/password_text_field.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/utils/error_message.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_validator.dart';
import 'package:vibezone/features/profile/domain/entities/device_session.dart';
import 'package:vibezone/features/profile/presentation/widget/menu_section.dart';
import 'package:vibezone/injection.dart';

import 'cubit/security_cubit.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SecurityCubit>()..loadSessions(),
      child: const _SecurityView(),
    );
  }
}

class _SecurityView extends StatelessWidget {
  const _SecurityView();

  void _onPageCommand(BuildContext context, SecurityState state) {
    final command = state.pageCommand;
    final s = S.of(context);
    if (command is PageCommandShowError) {
      SnackBarUtils.show(
        context,
        errorMessage(context, command.msg),
        isError: true,
      );
    } else if (command is PageCommandShowSuccess) {
      SnackBarUtils.show(
        context,
        command.msg == SecurityCubit.msgPasswordChanged
            ? s.msg_password_changed
            : s.msg_signed_out_devices(state.revokedCount),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    return BlocListener<SecurityCubit, SecurityState>(
      listenWhen: (p, c) =>
          c.pageCommand != null && p.pageCommand != c.pageCommand,
      listener: _onPageCommand,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).label_menu_security),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(padding, Spacing.x3, padding, 24),
            children: const [
              _ChangePasswordForm(),
              SizedBox(height: Spacing.x6),
              _DevicesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<_ChangePasswordForm> {
  // Bumped after a change so the fields are rebuilt empty.
  var _formKey = UniqueKey();
  String _current = '';
  String _new = '';
  String _confirm = '';
  String? _errCurrent;
  String? _errNew;
  String? _errConfirm;

  Future<void> _submit() async {
    final s = S.of(context);
    final validator = AuthValidator(s);
    setState(() {
      _errCurrent = _current.isEmpty ? s.err_password_required : null;
      _errNew = validator.password(_new);
      _errConfirm = validator.confirmPassword(_new, _confirm);
    });
    if (_errCurrent != null || _errNew != null || _errConfirm != null) return;

    FocusScope.of(context).unfocus();
    final changed = await context.read<SecurityCubit>().changePassword(
      currentPassword: _current,
      newPassword: _new,
    );
    if (changed && mounted) {
      setState(() {
        _formKey = UniqueKey();
        _current = _new = _confirm = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isLoading = context.select(
      (SecurityCubit c) => c.state.isChangingPassword,
    );
    return AutofillGroup(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.title_change_password,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Spacing.x3),
          PasswordTextField(
            hintText: s.hint_current_password,
            error: _errCurrent,
            textInputAction: TextInputAction.next,
            onChanged: (value) => _current = value,
          ),
          const SizedBox(height: Spacing.x3),
          PasswordTextField(
            hintText: s.hint_new_password,
            error: _errNew,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            onChanged: (value) => _new = value,
          ),
          const SizedBox(height: Spacing.x3),
          PasswordTextField(
            hintText: s.hint_confirm_password,
            error: _errConfirm,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.newPassword],
            onChanged: (value) => _confirm = value,
          ),
          const SizedBox(height: Spacing.x4),
          PrimaryButton(
            text: s.btn_update,
            isLoading: isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}

class _DevicesSection extends StatelessWidget {
  const _DevicesSection();

  Future<void> _revokeOthers(BuildContext context) async {
    final s = S.of(context);
    final confirmed = await showConfirmDialog(
      context,
      title: s.btn_sign_out_other_devices,
      message: s.mgs_sign_out_other_devices_confirm,
      confirmText: s.btn_sign_out,
      cancelText: s.txt_cancel,
      isDestructive: true,
    );
    if (confirmed && context.mounted) {
      context.read<SecurityCubit>().revokeOtherSessions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<SecurityCubit, SecurityState>(
      builder: (context, state) {
        final hasOthers = state.sessions.any((session) => !session.isCurrent);
        final Widget content;
        if (state.sessionsStatus == PageState.loading) {
          content = const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.sessionsStatus == PageState.error) {
          content = Center(
            child: TextButton(
              onPressed: context.read<SecurityCubit>().loadSessions,
              child: Text(s.btn_retry),
            ),
          );
        } else {
          content = MenuSectionCard(
            title: s.title_signed_in_devices,
            children: [
              for (final session in state.sessions)
                _SessionTile(
                  session: session,
                  isRevoking:
                      state.revokingId == session.id ||
                      (state.revokingId == SecurityState.allOthers &&
                          !session.isCurrent),
                ),
              if (!hasOthers)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    s.txt_no_other_devices,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            content,
            if (hasOthers) ...[
              const SizedBox(height: Spacing.x3),
              TextButton(
                onPressed: state.revokingId == null
                    ? () => _revokeOthers(context)
                    : null,
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
                child: Text(s.btn_sign_out_other_devices),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _SessionTile extends StatelessWidget {
  final DeviceSession session;
  final bool isRevoking;

  const _SessionTile({required this.session, required this.isRevoking});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final lastSeen = session.lastSeenAt;
    final subtitle = session.isCurrent
        ? s.txt_this_device
        : lastSeen == null
        ? null
        : '${s.txt_last_active}: ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(lastSeen.toLocal())}';
    return ListTile(
      leading: Icon(
        session.isCurrent ? Icons.smartphone_rounded : Icons.devices_rounded,
        color: theme.colorScheme.primary,
      ),
      title: Text(
        session.name.isEmpty ? '—' : session.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: subtitle == null ? null : Text(subtitle),
      trailing: session.isCurrent
          ? null
          : isRevoking
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : TextButton(
              onPressed: () =>
                  context.read<SecurityCubit>().revokeSession(session.id),
              child: Text(s.btn_sign_out),
            ),
    );
  }
}
