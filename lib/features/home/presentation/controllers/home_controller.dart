import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/presentation/controller.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/presentation/cubit/home_cubit.dart';

class HomeController extends Controller<Object> {
  HomeController(super.logger, super.popupManager);

  late final HomeCubit _homeCubit;

  List<Question> get questions => _homeCubit.questionsCache;
  List<Category> get categories => _homeCubit.categoriesCache;

  @override
  void onStart() {
    super.onStart();
    _homeCubit = context.read<HomeCubit>();
    _homeCubit.getQuestions();
    _homeCubit.getCategories();
  }

  void onSearchChanged(String value) {}

  void onPremiumOfferTap() {
    // TODO(Baran): Implement premium card tap logic.
  }

  void onQuestionTap(Question question) {
    // TODO(Baran): Implement question tap logic.
  }

  void onCategoryTap(Category category) {}
}
