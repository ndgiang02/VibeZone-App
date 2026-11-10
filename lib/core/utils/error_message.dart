import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_error_message.dart';

/// Maps an API error code (see `errors.dart`) to a localized message.
String errorMessage(BuildContext context, String code) {
  final s = S.of(context);
  switch (code) {
    case imageInvalid:
    case artworkInvalid:
      return s.err_image_invalid;
    case imageTooSmall:
    case artworkTooSmall:
      return s.err_image_too_small;
    case imageTooLarge:
    case artworkTooLarge:
      return s.err_image_too_large;
    // The API's code for a wrong current password isn't documented.
    case invalidPassword:
    case invalidCredential:
      return s.err_current_password_wrong;
    case passwordTooLong:
      return s.err_password_too_long;
    case audioRequired:
      return s.err_audio_required;
    case unsupportedFileType:
      return s.err_unsupported_file_type;
    case fileTooLarge:
      return s.err_file_too_large;
    case trackTitleInvalid:
      return s.err_title_required;
    case artistRequired:
      return s.err_artist_required;
    case slugTaken:
      return s.err_slug_taken;
    case playlistFull:
      return s.err_playlist_full;
    default:
      return authErrorMessage(context, code);
  }
}
