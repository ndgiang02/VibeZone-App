import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/features/auth/presentation/widget/auth_header.dart';

import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  final String? initialEmail;

  const ForgotPasswordForm({super.key, this.initialEmail});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  // Prefilled with the email typed on the login screen, if any.
  late final _controller = TextEditingController(text: widget.initialEmail);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final bloc = context.read<ForgotPasswordBloc>();
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) => Column(
        children: [
          AuthHeader(
            title: s.title_forgot_password,
            subtitle: s.txt_forgot_password_desc,
          ),
          const SizedBox(height: 32),
          CustomTextField(
            ctr: _controller,
            hintText: s.hint_text_email,
            error: state.errEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            prefixWidget: const SvgWidget(ic: icEmail),
            onChanged: (v) => bloc.add(ForgotPasswordEvent.onChangeEmail(v)),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: s.btn_send_reset_link,
            isLoading: state.isLoading,
            onPressed: state.email.isEmpty
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    bloc.add(ForgotPasswordEvent.onSubmit(context));
                  },
          ),
        ],
      ),
    );
  }
}
