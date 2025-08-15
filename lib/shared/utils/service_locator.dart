import 'package:get_it/get_it.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/data/services/home_remote_service.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions.dart';
import 'package:plant_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:plant_app/features/onboarding/presentation/controllers/onboarding_controller.dart';

import '../../core/network/api_manager.dart';
import '../../core/network/connectivity_manager.dart';
import '../../core/utils/logger.dart';
import '../../core/utils/popup_manager.dart';
import '../../features/diagnose/presentation/controllers/diagnose_controller.dart';
import '../../features/garden/presentation/controllers/my_garden_controller.dart';
import '../../features/home/presentation/controllers/home_controller.dart';
import '../../features/profile/presentation/controllers/profile_controller.dart';
import '../../features/scan_plant/controllers/scan_plant_controller.dart';

final locator = GetIt.instance;

abstract class ServiceLocator {
  static void initialize() {
    // Register core dependencies
    locator
      ..registerSingleton<Logger>(LoggerImpl())
      ..registerSingleton<ConnectivityManager>(ConnectivityManagerImpl())
      ..registerSingleton<PopupManager>(PopupManagerImpl())
      ..registerLazySingleton<ApiManager>(
        () => ApiManagerImpl(locator(), locator()),
      );

    // Register repositories
    locator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(locator()),
    );

    // Register services
    locator.registerLazySingleton<HomeRemoteService>(
      () => HomeRemoteServiceImpl(locator()),
    );

    // Register usecases
    locator
      ..registerLazySingleton(() => GetQuestions(locator()))
      ..registerLazySingleton(() => GetCategories(locator()));

    // Register controllers
    locator
      ..registerLazySingleton(() => OnboardingController(locator(), locator()))
      ..registerLazySingleton(() => HomeController(locator(), locator()))
      ..registerLazySingleton(() => DiagnoseController(locator(), locator()))
      ..registerLazySingleton(() => ScanPlantController(locator(), locator()))
      ..registerLazySingleton(() => MyGardenController(locator(), locator()))
      ..registerLazySingleton(() => ProfileController(locator(), locator()));

    // Register cubits
    locator.registerLazySingleton(() => HomeCubit(locator(), locator()));
  }
}
