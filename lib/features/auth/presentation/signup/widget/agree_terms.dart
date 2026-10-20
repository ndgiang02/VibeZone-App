import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_checkbox.dart';

import '../bloc/signup_bloc.dart';

class AgreeTerms extends StatelessWidget {
  const AgreeTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final isAgree = context.select((SignupBloc b) => b.state.isAgree);
    return Align(
      alignment: Alignment.centerLeft,
      child: AppCheckbox(
        value: isAgree,
        onChanged: (v) =>
            context.read<SignupBloc>().add(SignupEvent.onToggleAgree(v)),
        label: Text(
          S.of(context).txt_agree_terms,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
