import 'package:scube/app/core/notifier/base_notifier.dart';
import 'package:scube/app/di/usecase_provider.dart';

import '../state/dashboard_state.dart';

class DashboardNotifier extends BaseNotifier<DashboardState> {
  // final DashboardUseCase dashboardUseCase; // Removed manually injected field
  // @override
  // final Ref ref; // ref is already available in Notifier

  // DashboardNotifier({required this.ref, required this.dashboardUseCase}); // Removed constructor

  @override
  DashboardState build() {
    _fetchData();
    return const DashboardState(isLoading: true);
  }

  Future<void> _fetchData() async {
    try {
      final dashboardUseCase = ref.read(dashboardUseCaseProvider);
      final data = await dashboardUseCase.call();
      state = state.copyWith(isLoading: false, isSuccess: true, data: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  @override
  void reset() {
    state = const DashboardState();
  }
}
