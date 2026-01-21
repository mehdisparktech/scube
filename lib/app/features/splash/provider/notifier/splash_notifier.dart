import 'package:flutter/material.dart';
import 'package:scube/app/core/notifier/base_notifier.dart';
import 'package:scube/app/features/splash/provider/state/splash_state.dart';
import 'package:scube/app/route/app_routes.dart';

class SplashNotifier extends BaseNotifier<SplashState> {
  SplashNotifier();

  void onInit(BuildContext context) {
    if (state.isInitialized) return;
    state = state.copyWith(isInitialized: true);
    handleSplash(context);
  }

  @override
  SplashState build() {
    return const SplashState();
  }

  @override
  void reset() {
    state = state.copyWith(isInitialized: false);
  }

  Future<void> handleSplash(BuildContext context) async {
    // Show splash for at least 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      AppRoutes.goToLogin(context);
    }
  }
}
