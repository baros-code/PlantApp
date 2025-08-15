import 'package:equatable/equatable.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/question.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_questions.dart';

import '../../../../core/presentation/safe_cubit.dart';

part 'home_state.dart';

class HomeCubit extends SafeCubit<HomeState> {
  HomeCubit(this._getQuestions, this._getCategories) : super(HomeInitial());

  final GetQuestions _getQuestions;
  final GetCategories _getCategories;

  List<Question> questionsCache = [];
  List<Category> categoriesCache = [];

  Future<void> getQuestions() async {
    emit(HomeQuestionsLoading());
    final result = await _getQuestions();
    if (result.isSuccessful) {
      questionsCache = result.value!;
      emit(HomeQuestionsLoaded(questionsCache));
      return;
    }
    emit(HomeQuestionsError());
  }

  Future<void> getCategories() async {
    emit(HomeCategoriesLoading());
    final result = await _getCategories();
    if (result.isSuccessful) {
      categoriesCache = result.value!.data;
      emit(HomeCategoriesLoaded(categoriesCache));
      return;
    }
    emit(HomeCategoriesError());
  }
}
