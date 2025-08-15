import '../../../../core/network/api_manager.dart';
import '../../../../core/utils/result.dart';
import '../models/category_response_model.dart';
import '../models/question_model.dart';
import 'home_api.dart';

abstract class HomeRemoteService {
  Future<Result<List<QuestionModel>, Failure>> getQuestions();

  Future<Result<CategoryResponseModel, Failure>> getCategories();
}

class HomeRemoteServiceImpl extends HomeRemoteService {
  HomeRemoteServiceImpl(this._apiManager);

  final ApiManager _apiManager;

  @override
  Future<Result<List<QuestionModel>, Failure>> getQuestions() async {
    return _apiManager.call(HomeApi.getQuestions());
  }

  @override
  Future<Result<CategoryResponseModel, Failure>> getCategories() async {
    return _apiManager.call(HomeApi.getCategories());
  }
}
