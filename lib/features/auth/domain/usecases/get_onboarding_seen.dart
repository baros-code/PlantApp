import '../../../../core/utils/result.dart';
import '../../../../core/utils/use_case.dart';
import '../repositories/auth_repository.dart';

class GetOnboardingSeen extends UseCase<void, bool> {
  GetOnboardingSeen(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<bool, Failure>> call({void params}) {
    return _authRepository.getOnboardingSeen();
  }
}
