import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_checkbox.dart';
import 'package:vibezone/core/common/widgets/custom_button.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/features/auth/presentation/forgot_password/forgot_password_screen.dart';
import 'package:vibezone/features/auth/presentation/login/login_screen.dart';
import 'package:vibezone/features/auth/presentation/signup/signup_screen.dart';
import 'package:vibezone/features/home/presentation/widget/featured_banner.dart';
import 'package:vibezone/features/home/presentation/widget/home_header.dart';
import 'package:vibezone/features/miniplayer/presentation/miniplayer_page.dart';
import 'package:vibezone/features/search/presentation/widget/search_field.dart';
import 'package:vibezone/features/trending/presentation/widget/trending_podium.dart';
import 'package:vibezone/main.dart' as app;

/// End-to-end walk through: splash -> sign up -> forgot password -> login ->
/// home -> play -> minimize mini player -> trending -> search -> logout.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> wait(WidgetTester tester, int ms) async {
    final watch = Stopwatch()..start();
    while (watch.elapsedMilliseconds < ms) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> waitFor(WidgetTester tester, Finder finder) async {
    final watch = Stopwatch()..start();
    while (finder.evaluate().isEmpty) {
      if (watch.elapsed > const Duration(seconds: 15)) {
        throw TestFailure('Timed out waiting for $finder');
      }
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  /// Hides the keyboard first so the button isn't covered, then taps it.
  Future<void> tapButton(WidgetTester tester, Finder button) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await wait(tester, 800);
    await tester.ensureVisible(button);
    await wait(tester, 300);
    await tester.tap(button);
  }

  /// Focuses the field before typing so the text goes to the right input.
  Future<void> typeInto(WidgetTester tester, Finder finder, String text) async {
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await wait(tester, 300);
    await tester.enterText(finder, text);
    await wait(tester, 200);
  }

  Finder field(Type screen, int index) => find
      .descendant(of: find.byType(screen), matching: find.byType(TextFormField))
      .at(index);

  Finder primaryButton(Type screen) => find.descendant(
    of: find.byType(screen),
    matching: find.byType(ElevatedButton),
  );

  Finder tab(String icon) =>
      find.byWidgetPredicate((w) => w is SvgWidget && w.ic == icon).last;

  testWidgets('auth + main flow', (tester) async {
    await const FlutterSecureStorage().deleteAll();
    app.main();

    // Splash -> Get Started (not logged in yet).
    await waitFor(tester, find.byType(CustomButton));
    await wait(tester, 3500);
    await tester.tap(find.byType(CustomButton));
    await waitFor(tester, find.byType(LoginScreen));
    await wait(tester, 800);

    // ---- Sign up ----
    await tester.tapOnText(find.textRange.ofSubstring(S.current.btn_sign_up));
    await waitFor(tester, find.byType(SignupScreen));
    await wait(tester, 800);
    await typeInto(tester, field(SignupScreen, 0), 'Duy Giang');
    await typeInto(tester, field(SignupScreen, 1), 'taken@vibezone.app');
    await typeInto(tester, field(SignupScreen, 2), 'Abc123');
    await typeInto(tester, field(SignupScreen, 3), 'Abc124');
    await tapButton(tester, primaryButton(SignupScreen));
    await wait(tester, 800);
    expect(find.text(S.current.err_password_not_match), findsOneWidget);

    await typeInto(tester, field(SignupScreen, 3), 'Abc123');
    await tapButton(tester, primaryButton(SignupScreen));
    await wait(tester, 800);
    expect(find.text(S.current.err_agree_terms), findsOneWidget);

    await tester.tap(find.byType(AppCheckbox));
    await tapButton(tester, primaryButton(SignupScreen));
    await waitFor(
      tester,
      find.text(S.current.err_account_already_axists_for_that_email),
    );
    await wait(tester, 1000);

    await typeInto(tester, field(SignupScreen, 1), 'giang@vibezone.app');
    await tapButton(tester, primaryButton(SignupScreen));
    // Back on login with the new email prefilled.
    await waitFor(tester, find.text(S.current.msg_signup_success));
    await wait(tester, 1500);
    expect(find.byType(SignupScreen), findsNothing);
    expect(find.text('giang@vibezone.app'), findsOneWidget);

    // ---- Forgot password ----
    await tester.tap(find.text(S.current.btn_forgot_fassword));
    await waitFor(tester, find.byType(ForgotPasswordScreen));
    await wait(tester, 800);
    // Prefilled from the login screen.
    expect(find.text('giang@vibezone.app'), findsOneWidget);
    await typeInto(
      tester,
      field(ForgotPasswordScreen, 0),
      'notfound@vibezone.app',
    );
    await tapButton(tester, primaryButton(ForgotPasswordScreen));
    await waitFor(
      tester,
      find.text(S.current.err_no_user_found_for_that_email),
    );
    await wait(tester, 1000);
    await typeInto(tester, field(ForgotPasswordScreen, 0), 'giang@vibezone.app');
    await tapButton(tester, primaryButton(ForgotPasswordScreen));
    await waitFor(tester, find.text(S.current.title_check_your_email));
    await wait(tester, 1500);
    await tester.tap(find.text(S.current.btn_back_to_login));
    await wait(tester, 1500);
    expect(find.byType(ForgotPasswordScreen), findsNothing);

    // ---- Login ----
    await typeInto(tester, field(LoginScreen, 0), 'giang');
    await typeInto(tester, field(LoginScreen, 1), 'Abc123');
    await tapButton(tester, primaryButton(LoginScreen));
    await wait(tester, 1000);
    expect(find.text(S.current.err_email_invalid), findsOneWidget);

    await typeInto(tester, field(LoginScreen, 0), 'giang@vibezone.app');
    await tapButton(tester, primaryButton(LoginScreen));
    await waitFor(tester, find.byType(HomeHeader));
    expect(find.text('Giang ✨'), findsOneWidget);
    await wait(tester, 2000);

    // ---- Player ----
    await tester.tap(
      find
          .descendant(
            of: find.byType(FeaturedBanner),
            matching: find.byIcon(Icons.play_arrow_rounded),
          )
          .first,
    );
    await waitFor(tester, find.byTooltip('Minimize'));
    await wait(tester, 1500);
    await tester.tap(find.byTooltip('Minimize'));
    await wait(tester, 1500);
    expect(find.byTooltip('Minimize'), findsNothing);
    expect(find.byType(MiniPlayer), findsOneWidget);

    // ---- Trending, then expand the bubble again ----
    await tester.tap(tab(icExplore));
    await waitFor(tester, find.byType(TrendingPodium));
    await wait(tester, 1500);
    await tester.tap(find.byIcon(Icons.graphic_eq_rounded).last);
    await waitFor(tester, find.byTooltip('Minimize'));
    await wait(tester, 1000);

    // ---- Search ----
    await tester.tap(tab(icSearch));
    await waitFor(tester, find.byType(SearchField));
    await wait(tester, 1000);
    await typeInto(tester, find.byType(TextField).last, 'Sơn');
    await wait(tester, 2000);
    expect(find.text('Nơi này có anh'), findsWidgets);

    // ---- Profile -> logout ----
    await tester.tap(tab(icProfile));
    await wait(tester, 1500);
    expect(find.text('Giang'), findsOneWidget);
    final logout = find.widgetWithText(
      OutlinedButton,
      S.current.label_menu_log_out,
    );
    await tester.scrollUntilVisible(
      logout,
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await wait(tester, 800);
    await tester.tap(logout);
    await wait(tester, 1200);
    await tester.tap(find.byType(FilledButton).last);
    await waitFor(tester, find.byType(LoginScreen));
    await wait(tester, 1500);
  });
}
