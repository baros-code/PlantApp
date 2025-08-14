import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/api_manager.dart';
import 'package:plant_app/core/network/connectivity_manager.dart';
import 'package:plant_app/core/utils/logger.dart';
import 'package:plant_app/core/utils/popup_manager.dart';

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
  }
}
