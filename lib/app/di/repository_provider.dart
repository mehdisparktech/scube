// Auth Repository Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/app/di/datasource_provider.dart';
import 'package:scube/app/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:scube/app/features/dashboard/domain/repository/dashboard_repository.dart';

//Auth Repository Provider

// final authRepositoryProvider = Provider<AuthRepository>(
//   (ref) => AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider)),
// );

// Dashboard Repository Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) => DashboardRepositoryImpl(
    remoteDataSource: ref.read(dashboardRemoteDataSourceProvider),
  ),
);
