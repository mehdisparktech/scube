import 'package:flutter/material.dart';
import 'package:scube/app/core/notifier/base_notifier.dart';
import 'package:scube/app/core/services/storage_service.dart';
import 'package:scube/app/features/auth/presentation/provider/state/auth_state.dart';
import 'package:scube/app/route/app_routes.dart';

class AuthNotifier extends BaseNotifier<AuthState> {
  AuthNotifier();

  // Form controllers
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  AuthState build() {
    // Call async method without awaiting - it will check ref.mounted internally
    _checkAuthStatus();
    return const AuthState();
  }

  Future<void> _checkAuthStatus() async {
    final token = await StorageService.getToken();
    // Check if provider is still mounted before updating state
    if (!ref.mounted) return;

    final isLoggedIn = token != null && token.isNotEmpty;
    state = state.copyWith(isAuthenticated: isLoggedIn, token: token);
  }

  Future<void> login(String token) async {
    if (!ref.mounted) return;
    setLoading(true);
    try {
      await StorageService.saveToken(token);
      // Check if provider is still mounted after async operation
      if (!ref.mounted) return;

      state = state.copyWith(
        isAuthenticated: true,
        token: token,
        isLoading: false,
        isSuccess: true,
      );
    } catch (e) {
      if (!ref.mounted) return;
      setError(e.toString());
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    if (!ref.mounted) return;

    // Simulate login with a dummy token since we don't have a real backend yet
    // This updates the state to authenticated, allowing the AuthGuard to pass
    await login("dummy_auth_token");

    if (state.isAuthenticated && ref.mounted) {
      AppRoutes.goToDashboard(context);
    }
  }

  Future<void> logout() async {
    if (!ref.mounted) return;
    setLoading(true);
    try {
      await StorageService.clearAuth();
      // Check if provider is still mounted after async operation
      if (!ref.mounted) return;

      state = state.copyWith(
        isAuthenticated: false,
        token: null,
        isLoading: false,
        isSuccess: true,
      );
    } catch (e) {
      if (!ref.mounted) return;
      setError(e.toString());
    }
  }

  Future<void> checkAuth() async {
    await _checkAuthStatus();
  }

  @override
  void reset() {
    if (!ref.mounted) return;
    state = const AuthState();
  }
}
