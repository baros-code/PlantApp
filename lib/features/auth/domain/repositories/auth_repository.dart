import '../../../../core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<bool, Failure>> getOnboardingSeen();
  Future<Result> setOnboardingSeen();
}
