import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/features/auth/presentation/login/bloc/login_bloc.dart';

class ButtonLogin extends StatelessWidget {
  final LoginBloc bloc;

  const ButtonLogin({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: bloc,
      buildWhen: (p, c) => p.isEnable != c.isEnable,
      builder: (context, state) {
        return PrimaryButton(
          text: S.of(context).btn_login,
          onPressed: state.isEnable
              ? () {
                  FocusScope.of(context).unfocus();
                  bloc.add(LoginEvent.onLogin(context));
                }
              : null,
        );
      },
    );
  }
}
