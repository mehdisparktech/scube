import 'package:scube/app/features/dashboard/domain/entity/dashboard_second_entity.dart';
import 'package:scube/app/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardSecondUseCase {
  final DashboardRepository repository;

  DashboardSecondUseCase({required this.repository});

  Future<DashboardSecondEntity> call() async {
    return await repository.getDashboardSecondData();
  }
}
