import 'package:plant_app/core/network/api_manager_helpers.dart';

class AppConstants {
  const AppConstants._();

  static ApiSetupParams apiSetupParams = ApiSetupParams(
    baseUrl: 'https://dummy-api-jtg6bessta-ey.a.run.app',
    retryCount: 1,
  );

  static const String defaultStringValue = 'N/A';
}
