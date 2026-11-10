// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tab_home {
    return Intl.message('Home', name: 'tab_home', desc: '', args: []);
  }

  /// `Explore`
  String get tab_explore {
    return Intl.message('Explore', name: 'tab_explore', desc: '', args: []);
  }

  /// `My List`
  String get tab_my_list {
    return Intl.message('My List', name: 'tab_my_list', desc: '', args: []);
  }

  /// `Search`
  String get tab_search {
    return Intl.message('Search', name: 'tab_search', desc: '', args: []);
  }

  /// `Profile`
  String get tab_profile {
    return Intl.message('Profile', name: 'tab_profile', desc: '', args: []);
  }

  /// `Edit Profile`
  String get label_menu_edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'label_menu_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get label_menu_notification {
    return Intl.message(
      'Notification',
      name: 'label_menu_notification',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get label_menu_download {
    return Intl.message(
      'Download',
      name: 'label_menu_download',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get label_menu_security {
    return Intl.message(
      'Security',
      name: 'label_menu_security',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get label_menu_help_center {
    return Intl.message(
      'Help Center',
      name: 'label_menu_help_center',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get label_menu_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'label_menu_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get label_menu_log_out {
    return Intl.message(
      'Log out',
      name: 'label_menu_log_out',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get label_menu_dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'label_menu_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get label_menu_language {
    return Intl.message(
      'Language',
      name: 'label_menu_language',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get title_language {
    return Intl.message('Language', name: 'title_language', desc: '', args: []);
  }

  /// `Edit Profile`
  String get title_edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'title_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get btn_update {
    return Intl.message('Update', name: 'btn_update', desc: '', args: []);
  }

  /// `Country`
  String get hint_text_country {
    return Intl.message(
      'Country',
      name: 'hint_text_country',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get hint_text_email {
    return Intl.message('Email', name: 'hint_text_email', desc: '', args: []);
  }

  /// `Full name`
  String get hint_full_name {
    return Intl.message(
      'Full name',
      name: 'hint_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get hint_text_gender {
    return Intl.message('Gender', name: 'hint_text_gender', desc: '', args: []);
  }

  /// `Phone number`
  String get hint_text_phone_number {
    return Intl.message(
      'Phone number',
      name: 'hint_text_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Gender`
  String get title_gender {
    return Intl.message('Gender', name: 'title_gender', desc: '', args: []);
  }

  /// `Search...`
  String get hint_text_search_country {
    return Intl.message(
      'Search...',
      name: 'hint_text_search_country',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get btn_download {
    return Intl.message('Download', name: 'btn_download', desc: '', args: []);
  }

  /// `Play`
  String get btn_play {
    return Intl.message('Play', name: 'btn_play', desc: '', args: []);
  }

  /// `Now playing`
  String get title_now_playing {
    return Intl.message(
      'Now playing',
      name: 'title_now_playing',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get title_upcoming {
    return Intl.message('Upcoming', name: 'title_upcoming', desc: '', args: []);
  }

  /// `Popular`
  String get title_popular {
    return Intl.message('Popular', name: 'title_popular', desc: '', args: []);
  }

  /// `See all`
  String get see_all {
    return Intl.message('See all', name: 'see_all', desc: '', args: []);
  }

  /// `Sign up`
  String get btn_sign_up {
    return Intl.message('Sign up', name: 'btn_sign_up', desc: '', args: []);
  }

  /// `Don’t have an account? `
  String get txt_dont_have_an_account {
    return Intl.message(
      'Don’t have an account? ',
      name: 'txt_dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get txt_or_continue_with {
    return Intl.message(
      'or continue with',
      name: 'txt_or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Forgot  password?`
  String get btn_forgot_fassword {
    return Intl.message(
      'Forgot  password?',
      name: 'btn_forgot_fassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get btn_login {
    return Intl.message('Login', name: 'btn_login', desc: '', args: []);
  }

  /// `Remember me`
  String get txt_remember_me {
    return Intl.message(
      'Remember me',
      name: 'txt_remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Login to Your Account`
  String get txt_login_to_your_account {
    return Intl.message(
      'Login to Your Account',
      name: 'txt_login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hint_text_password {
    return Intl.message(
      'Password',
      name: 'hint_text_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get title_create_your_account {
    return Intl.message(
      'Create Your Account',
      name: 'title_create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get txt_already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'txt_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get txt_sign_in {
    return Intl.message('Sign in', name: 'txt_sign_in', desc: '', args: []);
  }

  /// `Email is invalid`
  String get err_email_invalid {
    return Intl.message(
      'Email is invalid',
      name: 'err_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter, one lowercase letter, and one number.`
  String get err_invalid_password {
    return Intl.message(
      'Password must contain at least one uppercase letter, one lowercase letter, and one number.',
      name: 'err_invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 5 characters including uppercase, lowercase and numbers`
  String get err_invalid_pass {
    return Intl.message(
      'Password must contain at least 5 characters including uppercase, lowercase and numbers',
      name: 'err_invalid_pass',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get err_no_user_found_for_that_email {
    return Intl.message(
      'No user found for that email.',
      name: 'err_no_user_found_for_that_email',
      desc: '',
      args: [],
    );
  }

  /// `Please check again email or password.`
  String get err_check_again_email_password {
    return Intl.message(
      'Please check again email or password.',
      name: 'err_check_again_email_password',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get err_password_providedIs_too_weak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'err_password_providedIs_too_weak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get err_account_already_axists_for_that_email {
    return Intl.message(
      'The account already exists for that email.',
      name: 'err_account_already_axists_for_that_email',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please check again`
  String get err_an_error_occurred_please_check_again {
    return Intl.message(
      'An error occurred, please check again',
      name: 'err_an_error_occurred_please_check_again',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your email first. Check your inbox for the verification link.`
  String get err_email_not_confirmed {
    return Intl.message(
      'Please confirm your email first. Check your inbox for the verification link.',
      name: 'err_email_not_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Cannot connect to the server. Please check your connection.`
  String get err_network_connection {
    return Intl.message(
      'Cannot connect to the server. Please check your connection.',
      name: 'err_network_connection',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again in a minute.`
  String get err_too_many_requests {
    return Intl.message(
      'Too many attempts. Please try again in a minute.',
      name: 'err_too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get title_verify_your_email {
    return Intl.message(
      'Verify your email',
      name: 'title_verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `A verification email has been sent to your address. Please check your inbox to complete the verification process`
  String get mgs_verify_email {
    return Intl.message(
      'A verification email has been sent to your address. Please check your inbox to complete the verification process',
      name: 'mgs_verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get btn_get_started {
    return Intl.message(
      'Get Started',
      name: 'btn_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Movie`
  String get title_welcome_to_movie {
    return Intl.message(
      'Welcome to Movie',
      name: 'title_welcome_to_movie',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get txt_cancel {
    return Intl.message('Cancel', name: 'txt_cancel', desc: '', args: []);
  }

  /// `Trending`
  String get tab_trending {
    return Intl.message('Trending', name: 'tab_trending', desc: '', args: []);
  }

  /// `Good morning`
  String get txt_good_morning {
    return Intl.message(
      'Good morning',
      name: 'txt_good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get txt_good_afternoon {
    return Intl.message(
      'Good afternoon',
      name: 'txt_good_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evening`
  String get txt_good_evening {
    return Intl.message(
      'Good evening',
      name: 'txt_good_evening',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to listen to today?`
  String get txt_what_to_listen {
    return Intl.message(
      'What do you want to listen to today?',
      name: 'txt_what_to_listen',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get genre_all {
    return Intl.message('All', name: 'genre_all', desc: '', args: []);
  }

  /// `Trending now`
  String get title_trending_now {
    return Intl.message(
      'Trending now',
      name: 'title_trending_now',
      desc: '',
      args: [],
    );
  }

  /// `Popular songs`
  String get title_popular_songs {
    return Intl.message(
      'Popular songs',
      name: 'title_popular_songs',
      desc: '',
      args: [],
    );
  }

  /// `Playlists`
  String get title_playlists {
    return Intl.message(
      'Playlists',
      name: 'title_playlists',
      desc: '',
      args: [],
    );
  }

  /// `Top artists`
  String get title_top_artists {
    return Intl.message(
      'Top artists',
      name: 'title_top_artists',
      desc: '',
      args: [],
    );
  }

  /// `Recently played`
  String get title_recently_played {
    return Intl.message(
      'Recently played',
      name: 'title_recently_played',
      desc: '',
      args: [],
    );
  }

  /// `songs`
  String get txt_songs {
    return Intl.message('songs', name: 'txt_songs', desc: '', args: []);
  }

  /// `followers`
  String get txt_followers {
    return Intl.message('followers', name: 'txt_followers', desc: '', args: []);
  }

  /// `Featured`
  String get txt_featured {
    return Intl.message('Featured', name: 'txt_featured', desc: '', args: []);
  }

  /// `Trending`
  String get title_trending {
    return Intl.message('Trending', name: 'title_trending', desc: '', args: []);
  }

  /// `Top tracks of the last 7 days`
  String get txt_trending_subtitle {
    return Intl.message(
      'Top tracks of the last 7 days',
      name: 'txt_trending_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `No trending tracks yet`
  String get txt_trending_empty {
    return Intl.message(
      'No trending tracks yet',
      name: 'txt_trending_empty',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get period_today {
    return Intl.message('Today', name: 'period_today', desc: '', args: []);
  }

  /// `This week`
  String get period_week {
    return Intl.message('This week', name: 'period_week', desc: '', args: []);
  }

  /// `This month`
  String get period_month {
    return Intl.message('This month', name: 'period_month', desc: '', args: []);
  }

  /// `Play all`
  String get btn_play_all {
    return Intl.message('Play all', name: 'btn_play_all', desc: '', args: []);
  }

  /// `plays`
  String get txt_plays {
    return Intl.message('plays', name: 'txt_plays', desc: '', args: []);
  }

  /// `NEW`
  String get txt_new {
    return Intl.message('NEW', name: 'txt_new', desc: '', args: []);
  }

  /// `Songs, artists, genres`
  String get hint_search {
    return Intl.message(
      'Songs, artists, genres',
      name: 'hint_search',
      desc: '',
      args: [],
    );
  }

  /// `Recent searches`
  String get title_recent_searches {
    return Intl.message(
      'Recent searches',
      name: 'title_recent_searches',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get btn_clear_all {
    return Intl.message('Clear all', name: 'btn_clear_all', desc: '', args: []);
  }

  /// `Browse all`
  String get title_browse_all {
    return Intl.message(
      'Browse all',
      name: 'title_browse_all',
      desc: '',
      args: [],
    );
  }

  /// `Songs`
  String get title_songs {
    return Intl.message('Songs', name: 'title_songs', desc: '', args: []);
  }

  /// `No results found`
  String get txt_no_results {
    return Intl.message(
      'No results found',
      name: 'txt_no_results',
      desc: '',
      args: [],
    );
  }

  /// `Try searching with another keyword`
  String get txt_try_another_keyword {
    return Intl.message(
      'Try searching with another keyword',
      name: 'txt_try_another_keyword',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get btn_retry {
    return Intl.message('Retry', name: 'btn_retry', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get mgs_logout_confirm {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'mgs_logout_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get hint_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'hint_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get err_name_required {
    return Intl.message(
      'Please enter your name',
      name: 'err_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get err_password_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'err_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms & Privacy Policy`
  String get txt_agree_terms {
    return Intl.message(
      'I agree to the Terms & Privacy Policy',
      name: 'txt_agree_terms',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms to continue`
  String get err_agree_terms {
    return Intl.message(
      'Please accept the terms to continue',
      name: 'err_agree_terms',
      desc: '',
      args: [],
    );
  }

  /// `Join VibeZone and enjoy millions of songs`
  String get txt_signup_subtitle {
    return Intl.message(
      'Join VibeZone and enjoy millions of songs',
      name: 'txt_signup_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Account created! Please sign in.`
  String get msg_signup_success {
    return Intl.message(
      'Account created! Please sign in.',
      name: 'msg_signup_success',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get title_forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'title_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email linked to your account and we will send you a link to reset your password.`
  String get txt_forgot_password_desc {
    return Intl.message(
      'Enter the email linked to your account and we will send you a link to reset your password.',
      name: 'txt_forgot_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Send reset link`
  String get btn_send_reset_link {
    return Intl.message(
      'Send reset link',
      name: 'btn_send_reset_link',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get title_check_your_email {
    return Intl.message(
      'Check your email',
      name: 'title_check_your_email',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a password reset link to`
  String get txt_reset_link_sent {
    return Intl.message(
      'We have sent a password reset link to',
      name: 'txt_reset_link_sent',
      desc: '',
      args: [],
    );
  }

  /// `Back to login`
  String get btn_back_to_login {
    return Intl.message(
      'Back to login',
      name: 'btn_back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get btn_resend {
    return Intl.message('Resend', name: 'btn_resend', desc: '', args: []);
  }

  /// `Didn't receive the email? `
  String get txt_didnt_receive {
    return Intl.message(
      'Didn\'t receive the email? ',
      name: 'txt_didnt_receive',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get title_account {
    return Intl.message('Account', name: 'title_account', desc: '', args: []);
  }

  /// `Preferences`
  String get title_preferences {
    return Intl.message(
      'Preferences',
      name: 'title_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get title_support {
    return Intl.message('Support', name: 'title_support', desc: '', args: []);
  }

  /// `Profile`
  String get title_profile {
    return Intl.message('Profile', name: 'title_profile', desc: '', args: []);
  }

  /// `Member since`
  String get txt_member_since {
    return Intl.message(
      'Member since',
      name: 'txt_member_since',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get title_select_language {
    return Intl.message(
      'Select language',
      name: 'title_select_language',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get txt_version {
    return Intl.message('Version', name: 'txt_version', desc: '', args: []);
  }

  /// `Upload a track`
  String get label_menu_upload {
    return Intl.message(
      'Upload a track',
      name: 'label_menu_upload',
      desc: '',
      args: [],
    );
  }

  /// `Display name`
  String get hint_display_name {
    return Intl.message(
      'Display name',
      name: 'hint_display_name',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated`
  String get msg_profile_updated {
    return Intl.message(
      'Profile updated',
      name: 'msg_profile_updated',
      desc: '',
      args: [],
    );
  }

  /// `Choose from library`
  String get btn_choose_photo {
    return Intl.message(
      'Choose from library',
      name: 'btn_choose_photo',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get btn_take_photo {
    return Intl.message(
      'Take a photo',
      name: 'btn_take_photo',
      desc: '',
      args: [],
    );
  }

  /// `Remove photo`
  String get btn_remove_photo {
    return Intl.message(
      'Remove photo',
      name: 'btn_remove_photo',
      desc: '',
      args: [],
    );
  }

  /// `Profile picture updated`
  String get msg_avatar_updated {
    return Intl.message(
      'Profile picture updated',
      name: 'msg_avatar_updated',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get title_change_password {
    return Intl.message(
      'Change password',
      name: 'title_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get hint_current_password {
    return Intl.message(
      'Current password',
      name: 'hint_current_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get hint_new_password {
    return Intl.message(
      'New password',
      name: 'hint_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password changed. Your other devices were signed out.`
  String get msg_password_changed {
    return Intl.message(
      'Password changed. Your other devices were signed out.',
      name: 'msg_password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Signed-in devices`
  String get title_signed_in_devices {
    return Intl.message(
      'Signed-in devices',
      name: 'title_signed_in_devices',
      desc: '',
      args: [],
    );
  }

  /// `This device`
  String get txt_this_device {
    return Intl.message(
      'This device',
      name: 'txt_this_device',
      desc: '',
      args: [],
    );
  }

  /// `Last active`
  String get txt_last_active {
    return Intl.message(
      'Last active',
      name: 'txt_last_active',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get btn_sign_out {
    return Intl.message('Sign out', name: 'btn_sign_out', desc: '', args: []);
  }

  /// `Sign out all other devices`
  String get btn_sign_out_other_devices {
    return Intl.message(
      'Sign out all other devices',
      name: 'btn_sign_out_other_devices',
      desc: '',
      args: [],
    );
  }

  /// `Sign out every device except this one?`
  String get mgs_sign_out_other_devices_confirm {
    return Intl.message(
      'Sign out every device except this one?',
      name: 'mgs_sign_out_other_devices_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Signed out {count} device(s)`
  String msg_signed_out_devices(Object count) {
    return Intl.message(
      'Signed out $count device(s)',
      name: 'msg_signed_out_devices',
      desc: '',
      args: [count],
    );
  }

  /// `No other devices are signed in`
  String get txt_no_other_devices {
    return Intl.message(
      'No other devices are signed in',
      name: 'txt_no_other_devices',
      desc: '',
      args: [],
    );
  }

  /// `Upload track`
  String get title_upload {
    return Intl.message(
      'Upload track',
      name: 'title_upload',
      desc: '',
      args: [],
    );
  }

  /// `Create your artist profile`
  String get title_become_artist {
    return Intl.message(
      'Create your artist profile',
      name: 'title_become_artist',
      desc: '',
      args: [],
    );
  }

  /// `You need an artist profile to publish tracks.`
  String get txt_become_artist_desc {
    return Intl.message(
      'You need an artist profile to publish tracks.',
      name: 'txt_become_artist_desc',
      desc: '',
      args: [],
    );
  }

  /// `Artist name`
  String get hint_artist_name {
    return Intl.message(
      'Artist name',
      name: 'hint_artist_name',
      desc: '',
      args: [],
    );
  }

  /// `Profile link (a-z, 0-9, _ or -)`
  String get hint_artist_slug {
    return Intl.message(
      'Profile link (a-z, 0-9, _ or -)',
      name: 'hint_artist_slug',
      desc: '',
      args: [],
    );
  }

  /// `Create artist profile`
  String get btn_create_artist {
    return Intl.message(
      'Create artist profile',
      name: 'btn_create_artist',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get hint_track_title {
    return Intl.message('Title', name: 'hint_track_title', desc: '', args: []);
  }

  /// `Description (optional)`
  String get hint_description {
    return Intl.message(
      'Description (optional)',
      name: 'hint_description',
      desc: '',
      args: [],
    );
  }

  /// `Genre`
  String get label_genre {
    return Intl.message('Genre', name: 'label_genre', desc: '', args: []);
  }

  /// `No genre`
  String get txt_no_genre {
    return Intl.message('No genre', name: 'txt_no_genre', desc: '', args: []);
  }

  /// `Visibility`
  String get label_visibility {
    return Intl.message(
      'Visibility',
      name: 'label_visibility',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get txt_visibility_public {
    return Intl.message(
      'Public',
      name: 'txt_visibility_public',
      desc: '',
      args: [],
    );
  }

  /// `Unlisted`
  String get txt_visibility_unlisted {
    return Intl.message(
      'Unlisted',
      name: 'txt_visibility_unlisted',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get txt_visibility_private {
    return Intl.message(
      'Private',
      name: 'txt_visibility_private',
      desc: '',
      args: [],
    );
  }

  /// `Choose cover`
  String get btn_choose_cover {
    return Intl.message(
      'Choose cover',
      name: 'btn_choose_cover',
      desc: '',
      args: [],
    );
  }

  /// `Choose audio file`
  String get btn_choose_audio {
    return Intl.message(
      'Choose audio file',
      name: 'btn_choose_audio',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get btn_upload {
    return Intl.message('Upload', name: 'btn_upload', desc: '', args: []);
  }

  /// `Uploading…`
  String get txt_uploading {
    return Intl.message(
      'Uploading…',
      name: 'txt_uploading',
      desc: '',
      args: [],
    );
  }

  /// `Processing audio…`
  String get txt_processing {
    return Intl.message(
      'Processing audio…',
      name: 'txt_processing',
      desc: '',
      args: [],
    );
  }

  /// `Your track is ready!`
  String get msg_upload_completed {
    return Intl.message(
      'Your track is ready!',
      name: 'msg_upload_completed',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't process this audio file.`
  String get msg_upload_failed {
    return Intl.message(
      'We couldn\'t process this audio file.',
      name: 'msg_upload_failed',
      desc: '',
      args: [],
    );
  }

  /// `Upload another`
  String get btn_upload_another {
    return Intl.message(
      'Upload another',
      name: 'btn_upload_another',
      desc: '',
      args: [],
    );
  }

  /// `Add to playlist`
  String get title_add_to_playlist {
    return Intl.message(
      'Add to playlist',
      name: 'title_add_to_playlist',
      desc: '',
      args: [],
    );
  }

  /// `New playlist`
  String get btn_new_playlist {
    return Intl.message(
      'New playlist',
      name: 'btn_new_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Playlist name`
  String get hint_playlist_title {
    return Intl.message(
      'Playlist name',
      name: 'hint_playlist_title',
      desc: '',
      args: [],
    );
  }

  /// `Public playlist`
  String get txt_public_playlist {
    return Intl.message(
      'Public playlist',
      name: 'txt_public_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get btn_create {
    return Intl.message('Create', name: 'btn_create', desc: '', args: []);
  }

  /// `You have no playlists yet`
  String get txt_no_playlists {
    return Intl.message(
      'You have no playlists yet',
      name: 'txt_no_playlists',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a title`
  String get err_title_required {
    return Intl.message(
      'Please enter a title',
      name: 'err_title_required',
      desc: '',
      args: [],
    );
  }

  /// `3–30 characters: a-z, 0-9, _ or -`
  String get err_slug_invalid {
    return Intl.message(
      '3–30 characters: a-z, 0-9, _ or -',
      name: 'err_slug_invalid',
      desc: '',
      args: [],
    );
  }

  /// `This profile link is already taken`
  String get err_slug_taken {
    return Intl.message(
      'This profile link is already taken',
      name: 'err_slug_taken',
      desc: '',
      args: [],
    );
  }

  /// `This image can't be used. Choose a JPEG, PNG or WebP.`
  String get err_image_invalid {
    return Intl.message(
      'This image can\'t be used. Choose a JPEG, PNG or WebP.',
      name: 'err_image_invalid',
      desc: '',
      args: [],
    );
  }

  /// `The image must be at least 200×200 px.`
  String get err_image_too_small {
    return Intl.message(
      'The image must be at least 200×200 px.',
      name: 'err_image_too_small',
      desc: '',
      args: [],
    );
  }

  /// `The image must be 10 MB or smaller.`
  String get err_image_too_large {
    return Intl.message(
      'The image must be 10 MB or smaller.',
      name: 'err_image_too_large',
      desc: '',
      args: [],
    );
  }

  /// `Your current password is incorrect`
  String get err_current_password_wrong {
    return Intl.message(
      'Your current password is incorrect',
      name: 'err_current_password_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The password is too long`
  String get err_password_too_long {
    return Intl.message(
      'The password is too long',
      name: 'err_password_too_long',
      desc: '',
      args: [],
    );
  }

  /// `Please choose an audio file`
  String get err_audio_required {
    return Intl.message(
      'Please choose an audio file',
      name: 'err_audio_required',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported file. Use MP3, WAV, FLAC, AAC, M4A, OGG or Opus.`
  String get err_unsupported_file_type {
    return Intl.message(
      'Unsupported file. Use MP3, WAV, FLAC, AAC, M4A, OGG or Opus.',
      name: 'err_unsupported_file_type',
      desc: '',
      args: [],
    );
  }

  /// `The audio file must be 200 MB or smaller.`
  String get err_file_too_large {
    return Intl.message(
      'The audio file must be 200 MB or smaller.',
      name: 'err_file_too_large',
      desc: '',
      args: [],
    );
  }

  /// `You need an artist profile to upload tracks.`
  String get err_artist_required {
    return Intl.message(
      'You need an artist profile to upload tracks.',
      name: 'err_artist_required',
      desc: '',
      args: [],
    );
  }

  /// `This playlist is full (500 tracks).`
  String get err_playlist_full {
    return Intl.message(
      'This playlist is full (500 tracks).',
      name: 'err_playlist_full',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get err_password_required {
    return Intl.message(
      'Please enter your password',
      name: 'err_password_required',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
