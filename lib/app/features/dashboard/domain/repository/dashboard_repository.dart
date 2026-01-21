import '../entity/dashboard_entity.dart';
import '../entity/dashboard_second_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboardData();
  Future<DashboardSecondEntity> getDashboardSecondData();
}
