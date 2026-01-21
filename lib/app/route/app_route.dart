import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scube/app/features/auth/presentation/screen/login_screen.dart';
import 'package:scube/app/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:scube/app/features/dashboard/presentation/screen/dashboard_second_screen.dart';
import 'package:scube/app/features/splash/presentation/screen/splash_screen.dart';

import 'app_routes.dart';
import 'auth_guard.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (BuildContext context, GoRouterState state) {
      return AuthGuard.redirect(ref, state);
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),

      // Login Screen
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),

      // Dashboard Screen (Protected)
      GoRoute(
        path: AppRoutes.dashboard,
        name: AppRoutes.dashboardRoute,
        builder: (context, state) => const DashboardScreen(),
      ),

      // Dashboard Second Screen
      GoRoute(
        path: AppRoutes.dashboardSecond,
        name: AppRoutes.dashboardSecondRoute,
        builder: (context, state) => const DashboardSecondScreen(),
      ),
    ],
  );
});
