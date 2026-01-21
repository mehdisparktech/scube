import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_state.dart';

/// ✅ Generic base notifier for all feature notifiers.
/// Example usage:
/// ```dart
/// class LoginNotifier extends BaseNotifier<LoginState> { ... }
/// ```
abstract class BaseNotifier<T extends BaseState> extends Notifier<T> {
  /// Update state safely with provided new state.
  void update(T newState) => state = newState;

  /// Set loading = true/false
  void setLoading(bool value) {
    state = state.copyWith(isLoading: value) as T;
  }

  /// Set error message and stop loading
  void setError(String? error) {
    state = state.copyWith(isLoading: false, error: error) as T;
  }

  /// Set success and stop loading
  void setSuccess([bool success = true]) {
    state = state.copyWith(isLoading: false, isSuccess: success) as T;
  }

  /// Clear error field
  void clearError() {
    state = state.copyWith(error: null) as T;
  }

  /// Reset to initial state — override in child class to provide initial state
  void reset();
}
