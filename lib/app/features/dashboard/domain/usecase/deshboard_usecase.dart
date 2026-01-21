import 'package:scube/app/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:scube/app/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardUseCase {
  final DashboardRepository repository;

  DashboardUseCase({required this.repository});

  Future<DashboardEntity> call() async {
    return await repository.getDashboardData();
  }
}
