import '../../../../core/utils/result.dart';
import '../entities/category_response.dart';
import '../entities/question.dart';

abstract class HomeRepository {
  Future<Result<List<Question>, Failure>> getQuestions();

  Future<Result<CategoryResponse, Failure>> getCategories();
}
