import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/configs/constants/errors.dart';

/// Maps an auth failure code (see `errors.dart`) to a localized message.
String authErrorMessage(BuildContext context, String code) {
  final s = S.of(context);
  switch (code) {
    case userNotFound:
      return s.err_no_user_found_for_that_email;
    case invalidCredential:
      return s.err_check_again_email_password;
    case emailAlreadyInUse:
      return s.err_account_already_axists_for_that_email;
    case weakPassword:
      return s.err_password_providedIs_too_weak;
    case notVerifyEmail:
      return s.err_email_not_confirmed;
    case networkError:
      return s.err_network_connection;
    case tooManyRequests:
      return s.err_too_many_requests;
    default:
      return s.err_an_error_occurred_please_check_again;
  }
}
