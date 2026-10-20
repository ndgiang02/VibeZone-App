import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/password_text_field.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';

import '../bloc/signup_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final s = S.of(context);
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (p, c) =>
          p.errName != c.errName ||
          p.errEmail != c.errEmail ||
          p.errPassword != c.errPassword ||
          p.errConfirmPassword != c.errConfirmPassword,
      builder: (context, state) => Column(
        children: [
          CustomTextField(
            hintText: s.hint_full_name,
            error: state.errName,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            prefixWidget: const SvgWidget(ic: icPerson),
            onChanged: (v) => bloc.add(SignupEvent.onChangeName(v)),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: s.hint_text_email,
            error: state.errEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixWidget: const SvgWidget(ic: icEmail),
            onChanged: (v) => bloc.add(SignupEvent.onChangeEmail(v)),
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            hintText: s.hint_text_password,
            error: state.errPassword,
            textInputAction: TextInputAction.next,
            onChanged: (v) => bloc.add(SignupEvent.onChangePassword(v)),
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            hintText: s.hint_confirm_password,
            error: state.errConfirmPassword,
            textInputAction: TextInputAction.done,
            onChanged: (v) => bloc.add(SignupEvent.onChangeConfirmPassword(v)),
          ),
        ],
      ),
    );
  }
}
