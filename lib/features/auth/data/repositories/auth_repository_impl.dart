import '../../../../core/utils/result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/shared_preferences_manager.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._sharedPreferencesManager);

  final SharedPreferencesManager _sharedPreferencesManager;

  @override
  Future<Result<bool, Failure>> getOnboardingSeen() async {
    try {
      return await _sharedPreferencesManager.getOnboardingSeen();
    }
    // It may throw exception if the value is not boolean. So we handle it here.
    catch (e) {
      return Result.failure(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result> setOnboardingSeen() async {
    try {
      return _sharedPreferencesManager.setOnboardingSeen();
    } catch (e) {
      return Result.failure(Failure(message: e.toString()));
    }
  }
}
