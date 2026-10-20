import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_checkbox.dart';
import 'package:vibezone/core/routing/routes_const.dart';

import '../bloc/login_bloc.dart';

class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRememberMe = context.select((LoginBloc b) => b.state.isRememberMe);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppCheckbox(
          value: isRememberMe,
          onChanged: (v) =>
              context.read<LoginBloc>().add(LoginEvent.onSelectedRemember(v)),
          label: Text(
            S.of(context).txt_remember_me,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () => context.push(
            forgotPassRoute,
            extra: context.read<LoginBloc>().state.email,
          ),
          child: Text(
            S.of(context).btn_forgot_fassword,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
