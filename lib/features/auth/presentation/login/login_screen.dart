import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/or_divider.dart';
import 'package:vibezone/core/common/widgets/text_link.dart';
import 'package:vibezone/core/routing/routes_const.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/auth/presentation/login/widget/button_login.dart';
import 'package:vibezone/features/auth/presentation/login/widget/email_input.dart';
import 'package:vibezone/features/auth/presentation/login/widget/login_social.dart';
import 'package:vibezone/features/auth/presentation/login/widget/password_input.dart';
import 'package:vibezone/features/auth/presentation/login/widget/remember_forgot_row.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_error_message.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_header.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_scaffold.dart';
import 'package:vibezone/injection.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>()..add(LoginEvent.onInitData()),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  Future<void> _openSignUp(BuildContext context) async {
    final bloc = context.read<LoginBloc>();
    final message = S.of(context).msg_signup_success;
    final email = await context.push<String>(signUpRoute);
    if (email != null && context.mounted) {
      bloc.add(LoginEvent.onChangeEmail(email));
      SnackBarUtils.show(context, message);
    }
  }

  void _onPageCommand(BuildContext context, PageCommand command) {
    if (command is PageCommandNavigatorPage && command.page == '/main') {
      context.go('/main');
    } else if (command is PageCommandShowAlertError) {
      SnackBarUtils.show(
        context,
        authErrorMessage(context, command.msg),
        isError: true,
      );
    }
    context.read<LoginBloc>().add(LoginEvent.onClearPage());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final s = S.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.pageCommand != null &&
          previous.pageCommand != current.pageCommand,
      listener: (context, state) => _onPageCommand(context, state.pageCommand!),
      child: AuthScaffold(
        children: [
          AuthHeader(title: s.txt_login_to_your_account),
          const SizedBox(height: 32),
          EmailInput(bloc: bloc),
          const SizedBox(height: 24),
          PasswordInput(bloc: bloc),
          const SizedBox(height: 12),
          const RememberForgotRow(),
          const SizedBox(height: 20),
          ButtonLogin(bloc: bloc),
          const SizedBox(height: 24),
          OrDivider(text: s.txt_or_continue_with),
          const SizedBox(height: 20),
          SignUpOrSignInSocial(
            onPressedFaceBook: () => bloc.add(LoginEvent.onSignInFacebook()),
            onPressedGoogle: () => bloc.add(LoginEvent.onSignInGoogle()),
            onPressedApple: () => bloc.add(LoginEvent.onSignInApple()),
          ),
          const SizedBox(height: 24),
          TextLink(
            text: s.txt_dont_have_an_account,
            action: s.btn_sign_up,
            onTap: () => _openSignUp(context),
          ),
        ],
      ),
    );
  }
}
