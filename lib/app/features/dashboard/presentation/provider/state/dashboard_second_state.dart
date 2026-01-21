import 'package:scube/app/core/notifier/base_state.dart';

import '../../../domain/entity/dashboard_second_entity.dart';

class DashboardSecondState extends BaseState {
  final int selectedTabIndex;
  final bool isSourceSelected;
  final DashboardSecondEntity? data;

  const DashboardSecondState({
    super.isLoading = false,
    super.error,
    super.isSuccess = false,
    this.selectedTabIndex = 0,
    this.isSourceSelected = true,
    this.data,
  });

  @override
  DashboardSecondState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    int? selectedTabIndex,
    bool? isSourceSelected,
    DashboardSecondEntity? data,
  }) {
    return DashboardSecondState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      isSourceSelected: isSourceSelected ?? this.isSourceSelected,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    selectedTabIndex,
    isSourceSelected,
    data,
  ];
}
