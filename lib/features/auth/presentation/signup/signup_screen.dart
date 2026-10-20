import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/or_divider.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/core/common/widgets/text_link.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/auth/presentation/login/widget/login_social.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_error_message.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_header.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_scaffold.dart';
import 'package:vibezone/injection.dart';

import 'bloc/signup_bloc.dart';
import 'widget/agree_terms.dart';
import 'widget/signup_form.dart';

/// Pops with the registered email so the login screen can prefill it.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupBloc>(),
      child: const _SignupView(),
    );
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView();

  void _onPageCommand(BuildContext context, PageCommand command) {
    if (command is PageCommandNavigatorPage) {
      context.pop(command.argument as String);
    } else if (command is PageCommandShowAlertError) {
      SnackBarUtils.show(
        context,
        authErrorMessage(context, command.msg),
        isError: true,
      );
    } else if (command is PageCommandShowToast) {
      SnackBarUtils.show(context, command.msg, isError: true);
    }
    context.read<SignupBloc>().add(const SignupEvent.onClearPage());
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocListener<SignupBloc, SignupState>(
      listenWhen: (p, c) =>
          c.pageCommand != null && p.pageCommand != c.pageCommand,
      listener: (context, state) => _onPageCommand(context, state.pageCommand!),
      child: AuthScaffold(
        children: [
          AuthHeader(
            title: s.title_create_your_account,
            subtitle: s.txt_signup_subtitle,
          ),
          const SizedBox(height: 32),
          const SignupForm(),
          const SizedBox(height: 20),
          const AgreeTerms(),
          const SizedBox(height: 24),
          BlocBuilder<SignupBloc, SignupState>(
            buildWhen: (p, c) =>
                p.isLoading != c.isLoading || p.canSubmit != c.canSubmit,
            builder: (context, state) => PrimaryButton(
              text: s.btn_sign_up,
              isLoading: state.isLoading,
              onPressed: state.canSubmit
                  ? () {
                      FocusScope.of(context).unfocus();
                      context.read<SignupBloc>().add(
                        SignupEvent.onSubmit(context),
                      );
                    }
                  : null,
            ),
          ),
          const SizedBox(height: 24),
          OrDivider(text: s.txt_or_continue_with),
          const SizedBox(height: 20),
          SignUpOrSignInSocial(
            onPressedFaceBook: () {},
            onPressedGoogle: () {},
            onPressedApple: () {},
          ),
          const SizedBox(height: 24),
          TextLink(
            text: s.txt_already_have_an_account,
            action: s.txt_sign_in,
            onTap: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
