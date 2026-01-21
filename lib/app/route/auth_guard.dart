import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scube/app/features/auth/presentation/provider/auth_providers.dart';
import 'package:scube/app/route/app_routes.dart';

class AuthGuard {
  /// Redirects user based on authentication status
  static String? redirect(Ref ref, GoRouterState state) {
    final authState = ref.read(authProvider);
    final isAuthenticated = authState.isAuthenticated;
    final isGoingToLogin = state.matchedLocation == AppRoutes.login;
    final isGoingToSplash = state.matchedLocation == AppRoutes.splash;

    // If user is authenticated and trying to access login, redirect to dashboard
    if (isAuthenticated && isGoingToLogin) {
      return AppRoutes.dashboard;
    }

    // If user is not authenticated and trying to access protected routes
    if (!isAuthenticated && !isGoingToLogin && !isGoingToSplash) {
      return AppRoutes.login;
    }

    // Allow access to splash and login if not authenticated
    if (!isAuthenticated && (isGoingToLogin || isGoingToSplash)) {
      return null;
    }

    // Allow access to protected routes if authenticated
    if (isAuthenticated && !isGoingToLogin) {
      return null;
    }

    return null;
  }
}
