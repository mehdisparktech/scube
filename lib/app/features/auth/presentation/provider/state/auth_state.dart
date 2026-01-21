import 'package:scube/app/core/notifier/base_state.dart';

class AuthState extends BaseState {
  final bool isAuthenticated;
  final String? token;

  const AuthState({
    super.isLoading,
    super.error,
    super.isSuccess,
    this.isAuthenticated = false,
    this.token,
  });

  @override
  List<Object?> get props => [
    isLoading,
    error,
    isSuccess,
    isAuthenticated,
    token,
  ];

  @override
  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
    );
  }
}
