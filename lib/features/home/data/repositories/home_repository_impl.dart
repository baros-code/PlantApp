import '../../../../core/utils/result.dart';
import '../../domain/entities/category_response.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/home_repository.dart';
import '../services/home_remote_service.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this._homeRemoteService);

  final HomeRemoteService _homeRemoteService;

  @override
  Future<Result<List<Question>, Failure>> getQuestions() async {
    try {
      final result = await _homeRemoteService.getQuestions();
      if (result.isSuccessful) {
        return Result.success(
          value: result.value!.map((e) => e.toEntity()).toList(),
        );
      }
      return Result.failure(Failure(message: result.error!.message));
    } catch (e) {
      return Result.failure(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result<CategoryResponse, Failure>> getCategories() async {
    try {
      final result = await _homeRemoteService.getCategories();
      if (result.isSuccessful) {
        return Result.success(value: result.value!.toEntity());
      }
      return Result.failure(Failure(message: result.error!.message));
    } catch (e) {
      return Result.failure(Failure(message: e.toString()));
    }
  }
}
