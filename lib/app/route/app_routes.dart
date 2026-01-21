import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // Base paths for the app
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String dashboardSecond = '/dashboard-second';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Named routes for GoRouter navigation
  static const String splashRoute = 'splash';
  static const String loginRoute = 'login';
  static const String dashboardRoute = 'dashboard';
  static const String dashboardSecondRoute = 'dashboardSecond';
  static const String signupRoute = 'signup';
  static const String forgotPasswordRoute = 'forgot-password';

  static void goToLogin(BuildContext context) => context.goNamed(loginRoute);
  static void goToSplash(BuildContext context) => context.goNamed(splashRoute);
  static void goToDashboard(BuildContext context) =>
      context.goNamed(dashboardRoute);
  static void goToDashboardSecond(BuildContext context) =>
      context.pushNamed(dashboardSecondRoute);
  static void goToSignup(BuildContext context) => context.goNamed(signupRoute);
  static void goToForgotPassword(BuildContext context) =>
      context.goNamed(forgotPasswordRoute);
}
