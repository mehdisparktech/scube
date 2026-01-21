import 'package:scube/app/core/notifier/base_state.dart';

import '../../../domain/entity/dashboard_entity.dart';

class DashboardState extends BaseState {
  final DashboardEntity? data;

  const DashboardState({
    super.isLoading = false,
    super.error,
    super.isSuccess = false,
    this.data,
  });

  @override
  DashboardState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    DashboardEntity? data,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [...super.props, data];
}
