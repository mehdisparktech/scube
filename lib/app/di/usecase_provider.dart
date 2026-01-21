// Auth UseCase Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/app/di/repository_provider.dart';
import 'package:scube/app/features/dashboard/domain/usecase/deshboard_second_usecase.dart';
import 'package:scube/app/features/dashboard/domain/usecase/deshboard_usecase.dart';

// Auth UseCase Provider
// final authUseCaseProvider = Provider<AuthUseCase>(
//   (ref) => AuthUseCase(ref.read(authRepositoryProvider)),
// );

// Dashboard UseCase Provider
final dashboardUseCaseProvider = Provider<DashboardUseCase>(
  (ref) => DashboardUseCase(repository: ref.read(dashboardRepositoryProvider)),
);

final dashboardSecondUseCaseProvider = Provider<DashboardSecondUseCase>(
  (ref) =>
      DashboardSecondUseCase(repository: ref.read(dashboardRepositoryProvider)),
);
