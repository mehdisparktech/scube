import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/app/features/dashboard/data/datasources/remote/deshboard_remote_datasource.dart';

// Auth Remote DataSource Provider
// final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
//   (ref) => AuthRemoteDataSourceImpl(),
// );

// Dashboard Remote DataSource Provider
final dashboardRemoteDataSourceProvider = Provider<DeshboardRemoteDataSource>(
  (ref) => DeshboardRemoteDataSourceImpl(),
);
