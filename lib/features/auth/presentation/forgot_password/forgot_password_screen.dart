import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_error_message.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_scaffold.dart';
import 'package:vibezone/injection.dart';

import 'bloc/forgot_password_bloc.dart';
import 'widget/forgot_password_form.dart';
import 'widget/reset_link_sent.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String? email;

  const ForgotPasswordScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = getIt<ForgotPasswordBloc>();
        if (email?.isNotEmpty ?? false) {
          bloc.add(ForgotPasswordEvent.onChangeEmail(email!));
        }
        return bloc;
      },
      child: _ForgotPasswordView(email: email),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  final String? email;

  const _ForgotPasswordView({this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (p, c) =>
          c.pageCommand != null && p.pageCommand != c.pageCommand,
      listener: (context, state) {
        final command = state.pageCommand;
        if (command is PageCommandShowAlertError) {
          SnackBarUtils.show(
            context,
            authErrorMessage(context, command.msg),
            isError: true,
          );
        }
        context.read<ForgotPasswordBloc>().add(
          const ForgotPasswordEvent.onClearPage(),
        );
      },
      child: AuthScaffold(
        children: [
          BlocSelector<ForgotPasswordBloc, ForgotPasswordState, bool>(
            selector: (state) => state.isSent,
            builder: (context, isSent) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSent
                  ? const ResetLinkSent(key: ValueKey('sent'))
                  : ForgotPasswordForm(
                      key: const ValueKey('form'),
                      initialEmail: email,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
