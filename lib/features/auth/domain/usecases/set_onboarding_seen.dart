import '../../../../core/utils/result.dart';
import '../../../../core/utils/use_case.dart';
import '../repositories/auth_repository.dart';

class SetOnboardingSeen extends UseCase<void, Object> {
  SetOnboardingSeen(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result> call({void params}) async {
    return _authRepository.setOnboardingSeen();
  }
}
