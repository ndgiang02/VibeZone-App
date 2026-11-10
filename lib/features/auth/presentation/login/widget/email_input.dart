import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/features/auth/presentation/login/bloc/login_bloc.dart';

class EmailInput extends StatefulWidget {
  final LoginBloc bloc;
  const EmailInput({super.key, required this.bloc});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final TextEditingController _ctrEmail = TextEditingController();

  @override
  void dispose() {
    _ctrEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.errEmail != current.errEmail,
      bloc: widget.bloc,
      builder: (context, state) {
        // Only sync when the bloc changes the value (e.g. remembered email),
        // otherwise the cursor would jump while typing.
        final email = state.email ?? '';
        if (_ctrEmail.text != email) _ctrEmail.text = email;
        return CustomTextField(
          initValue: state.email,
          hintText: S.of(context).hint_text_email,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          error: state.errEmail,
          prefixWidget: SvgWidget(ic: icEmail),
          onChanged: (val) => widget.bloc.add(LoginEvent.onChangeEmail(val)),
          ctr: _ctrEmail,
        );
      },
    );
  }
}
