import '../../../../core/utils/result.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/category_response.dart';
import '../repositories/home_repository.dart';

class GetCategories extends UseCase<void, CategoryResponse> {
  GetCategories(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Result<CategoryResponse, Failure>> call({void params}) {
    return _homeRepository.getCategories();
  }
}
