import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/dashboard_notifier.dart';
import 'notifier/dashboard_second_notifier.dart';
import 'state/dashboard_second_state.dart';
import 'state/dashboard_state.dart';

final dashboardProvider =
    NotifierProvider.autoDispose<DashboardNotifier, DashboardState>(
      DashboardNotifier.new,
    );

final dashboardSecondProvider =
    NotifierProvider.autoDispose<DashboardSecondNotifier, DashboardSecondState>(
      DashboardSecondNotifier.new,
    );
