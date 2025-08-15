import 'dart:convert';

import '../../../../core/network/api_manager_helpers.dart';
import '../models/category_response_model.dart';
import '../models/question_model.dart';

abstract class HomeApi {
  static ApiCall<List<QuestionModel>> getQuestions() {
    return ApiCall(
      method: ApiMethod.get,
      path: '/getQuestions',
      responseMapper: (response) {
        // If it's a string, decode it first
        if (response is String) {
          response = jsonDecode(response);
        }
        return (response as List)
            .map((e) => QuestionModel.fromJson(e))
            .toList();
      },
    );
  }

  static ApiCall<CategoryResponseModel> getCategories() {
    return ApiCall(
      method: ApiMethod.get,
      path: '/getCategories',
      responseMapper: (response) {
        // If it's a string, decode it first
        if (response is String) {
          response = jsonDecode(response);
        }
        return CategoryResponseModel.fromJson(response);
      },
    );
  }
}
