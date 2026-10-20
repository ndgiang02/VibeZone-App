import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/extensions/valid_email.dart';
import 'package:vibezone/core/extensions/valid_password.dart';

/// Form validation shared by login, sign up and forgot password.
/// Each method returns a localized error, or `null` when the value is valid.
class AuthValidator {
  final S s;

  AuthValidator(this.s);

  String? name(String? value) =>
      (value ?? '').trim().isEmpty ? s.err_name_required : null;

  String? email(String? value) =>
      (value ?? '').trim().isValidEmail ? null : s.err_email_invalid;

  String? password(String? value) {
    final password = value ?? '';
    if (password.length < 5) return s.err_invalid_pass;
    if (!password.isValidPassWord) return s.err_invalid_password;
    return null;
  }

  String? confirmPassword(String? password, String? confirm) =>
      password == confirm ? null : s.err_password_not_match;
}
