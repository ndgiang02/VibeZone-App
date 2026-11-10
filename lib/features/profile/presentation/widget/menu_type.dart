import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';

enum MenuSection {
  account,
  preferences,
  support;

  String title(BuildContext context) {
    switch (this) {
      case MenuSection.account:
        return S.of(context).title_account;
      case MenuSection.preferences:
        return S.of(context).title_preferences;
      case MenuSection.support:
        return S.of(context).title_support;
    }
  }

  List<MenuType> get items =>
      MenuType.values.where((item) => item.section == this).toList();
}

enum MenuType {
  editProfile,
  upload,
  notification,
  download,
  security,
  language,
  darkMode,
  helpCenter,
  privacyPolicy;

  String name(BuildContext context) {
    switch (this) {
      case MenuType.editProfile:
        return S.of(context).label_menu_edit_profile;
      case MenuType.upload:
        return S.of(context).label_menu_upload;
      case MenuType.notification:
        return S.of(context).label_menu_notification;
      case MenuType.download:
        return S.of(context).label_menu_download;
      case MenuType.security:
        return S.of(context).label_menu_security;
      case MenuType.language:
        return S.of(context).label_menu_language;
      case MenuType.darkMode:
        return S.of(context).label_menu_dark_mode;
      case MenuType.helpCenter:
        return S.of(context).label_menu_help_center;
      case MenuType.privacyPolicy:
        return S.of(context).label_menu_privacy_policy;
    }
  }

  String get ic {
    switch (this) {
      case MenuType.editProfile:
        return 'assets/icons/ic_person.svg';
      case MenuType.upload:
        return 'assets/icons/ic_tab_upload.svg';
      case MenuType.notification:
        return 'assets/icons/ic_noti.svg';
      case MenuType.download:
        return 'assets/icons/ic_download.svg';
      case MenuType.security:
        return 'assets/icons/ic_security.svg';
      case MenuType.language:
        return 'assets/icons/ic_language.svg';
      case MenuType.darkMode:
        return 'assets/icons/ic_dark_mode.svg';
      case MenuType.helpCenter:
        return 'assets/icons/ic_helper.svg';
      case MenuType.privacyPolicy:
        return 'assets/icons/ic_sercurity.svg';
    }
  }

  MenuSection get section {
    switch (this) {
      case MenuType.editProfile:
      case MenuType.upload:
      case MenuType.notification:
      case MenuType.download:
      case MenuType.security:
        return MenuSection.account;
      case MenuType.language:
      case MenuType.darkMode:
        return MenuSection.preferences;
      case MenuType.helpCenter:
      case MenuType.privacyPolicy:
        return MenuSection.support;
    }
  }
}
