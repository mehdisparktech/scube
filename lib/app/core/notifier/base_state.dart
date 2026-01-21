/// Base state class that can be extended by all feature states
/// Provides common fields for loading, error, and success states
library;

import 'package:equatable/equatable.dart';

class BaseState extends Equatable {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const BaseState({this.isLoading = false, this.error, this.isSuccess = false});

  BaseState copyWith({bool? isLoading, String? error, bool? isSuccess}) {
    return BaseState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, isSuccess];
}
