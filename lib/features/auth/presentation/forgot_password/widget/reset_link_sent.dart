import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/core/common/widgets/text_link.dart';

import '../bloc/forgot_password_bloc.dart';

class ResetLinkSent extends StatelessWidget {
  const ResetLinkSent({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final state = context.watch<ForgotPasswordBloc>().state;
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary.withValues(alpha: 0.15),
          ),
          child: Icon(
            Icons.mark_email_read_rounded,
            size: 64,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 32),
        Text(s.title_check_your_email, style: theme.textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(
          s.txt_reset_link_sent,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          state.email.trim(),
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 40),
        PrimaryButton(
          text: s.btn_back_to_login,
          onPressed: () => context.pop(),
        ),
        const SizedBox(height: 24),
        state.isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : TextLink(
                text: s.txt_didnt_receive,
                action: s.btn_resend,
                onTap: () => context.read<ForgotPasswordBloc>().add(
                  const ForgotPasswordEvent.onResend(),
                ),
              ),
      ],
    );
  }
}
