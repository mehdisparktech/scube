import 'package:scube/app/features/dashboard/data/datasources/remote/deshboard_remote_datasource.dart';

import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/dashboard_second_entity.dart';
import '../../domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DeshboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DashboardEntity> getDashboardData() async {
    return remoteDataSource.getDashboardData();
  }

  @override
  Future<DashboardSecondEntity> getDashboardSecondData() async {
    return remoteDataSource.getDashboardSecondData();
  }
}
