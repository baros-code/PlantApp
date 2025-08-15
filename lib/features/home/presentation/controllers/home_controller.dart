import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/controller.dart';
import '../../../paywall/presentation/pages/paywall_page.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/question.dart';
import '../cubit/home_cubit.dart';

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

  @override
  void onReady() {
    super.onReady();
    popupManager.showFullScreenPopup(context, PaywallPage());
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
