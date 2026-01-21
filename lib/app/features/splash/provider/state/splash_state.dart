import 'package:scube/app/core/notifier/base_state.dart';

class SplashState extends BaseState {
  final bool isInitialized;

  const SplashState({
    super.isLoading,
    super.error,
    super.isSuccess,
    this.isInitialized = false,
  });

  @override
  List<Object?> get props => [isLoading, error, isSuccess, isInitialized];

  @override
  SplashState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    bool? isInitialized,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}
