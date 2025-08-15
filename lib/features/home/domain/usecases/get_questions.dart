import '../../../../core/utils/result.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/question.dart';
import '../repositories/home_repository.dart';

class GetQuestions extends UseCase<void, List<Question>> {
  GetQuestions(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Result<List<Question>, Failure>> call({void params}) {
    return _homeRepository.getQuestions();
  }
}
