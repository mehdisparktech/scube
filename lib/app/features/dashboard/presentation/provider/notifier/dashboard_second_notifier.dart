import 'package:scube/app/core/notifier/base_notifier.dart';
import 'package:scube/app/di/usecase_provider.dart';

import '../state/dashboard_second_state.dart';

class DashboardSecondNotifier extends BaseNotifier<DashboardSecondState> {
  // final DashboardSecondUseCase useCase; // Removed
  // @override
  // final Ref ref; // Removed

  // DashboardSecondNotifier(this.useCase, this.ref); // Removed constructor

  @override
  DashboardSecondState build() {
    _fetchData();
    return const DashboardSecondState(isLoading: true);
  }

  Future<void> _fetchData() async {
    try {
      final useCase = ref.read(dashboardSecondUseCaseProvider);
      final data = await useCase.call();
      state = state.copyWith(isLoading: false, isSuccess: true, data: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void toggleSource(bool isSource) {
    state = state.copyWith(isSourceSelected: isSource);
  }

  @override
  void reset() {
    state = const DashboardSecondState();
  }
}
