import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/result.dart';

abstract class SharedPreferencesManager {
  Future<Result<bool, Failure>> getOnboardingSeen();
  Future<Result> setOnboardingSeen();
}

class SharedPreferencesManagerImpl extends SharedPreferencesManager {
  SharedPreferencesManagerImpl();

  final _onboardingSeenKey = 'onboarding_seen';

  @override
  Future<Result<bool, Failure>> getOnboardingSeen() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getBool(_onboardingSeenKey);
    // If above throws an error, it'll be handled in repository layer.
    return Result.success(value: value);
  }

  @override
  Future<Result> setOnboardingSeen() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_onboardingSeenKey, true);
    return Result.success();
  }
}
