import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/password_text_field.dart';
import 'package:vibezone/features/auth/presentation/login/bloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  final LoginBloc bloc;
  const PasswordInput({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.errPassword != current.errPassword,
      bloc: bloc,
      builder: (context, state) {
        return PasswordTextField(
          hintText: S.of(context).hint_text_password,
          error: state.errPassword,
          textInputAction: TextInputAction.done,
          onChanged: (val) => bloc.add(LoginEvent.onChangePassword(val)),
        );
      },
    );
  }
}
