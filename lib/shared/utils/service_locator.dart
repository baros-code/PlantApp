import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/api_manager.dart';
import 'package:plant_app/core/network/connectivity_manager.dart';
import 'package:plant_app/core/utils/logger.dart';
import 'package:plant_app/core/utils/popup_manager.dart';
import 'package:plant_app/features/diagnose/presentation/controllers/diagnose_controller.dart';
import 'package:plant_app/features/garden/presentation/controllers/my_garden_controller.dart';
import 'package:plant_app/features/home/presentation/controllers/home_controller.dart';
import 'package:plant_app/features/profile/presentation/controllers/profile_controller.dart';
import 'package:plant_app/features/qr_scan/controllers/qr_scan_controller.dart';

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

    // Register controllers
    locator.registerLazySingleton(() => HomeController(locator(), locator()));
    locator.registerLazySingleton(
      () => DiagnoseController(locator(), locator()),
    );
    locator.registerLazySingleton(() => QrScanController(locator(), locator()));
    locator.registerLazySingleton(
      () => MyGardenController(locator(), locator()),
    );
    locator.registerLazySingleton(
      () => ProfileController(locator(), locator()),
    );
  }
}
