import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/features/player/presentation/play_screen.dart';
import 'package:vibezone/main.dart';

import '../../features/auth/presentation/forgot_password/forgot_password_screen.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/signup/signup_screen.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'routes_const.dart';

class AppRoutes {
  static GoRouter? _router;

  static GoRouter getRouter(BuildContext context) {
    return _router ??= GoRouter(
      // Shared with DialogUtils so loading dialogs use the router's navigator.
      navigatorKey: navigatorKey,
      initialLocation: '/splash',
      routes: [
        GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: LoginScreen(),
            transitionsBuilder: _customTransition,
          ),
        ),
        GoRoute(
          path: signUpRoute,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: forgotPassRoute,
          builder: (context, state) =>
              ForgotPasswordScreen(email: state.extra as String?),
        ),
        GoRoute(path: '/main', builder: (context, state) => MainScreen()),
        GoRoute(
          path: '/play',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const PlayScreen(),
            transitionsBuilder: _slideUpTransition,
          ),
        ),
      ],
    );
  }

  static Widget _customTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  static Widget _slideUpTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: child,
    );
  }
}
