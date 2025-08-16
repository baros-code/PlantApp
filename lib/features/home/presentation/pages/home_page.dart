import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../core/presentation/sub_view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/presentation/pages/base_page.dart';
import '../../../../shared/presentation/widgets/custom_search_bar.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/theme/theme_provider.dart';
import '../../../../shared/utils/build_context_ext.dart';
import '../controllers/home_controller.dart';
import '../cubit/home_cubit.dart';
import '../widgets/category_card.dart';
import '../widgets/premium_offer_card.dart';
import '../widgets/question_card.dart';
import '../widgets/theme_toggle.dart';

class HomePage extends ControlledView<HomeController, Object> {
  HomePage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return BasePage(body: _HomeView());
  }
}

class _HomeView extends SubView<HomeController> {
  _HomeView();

  @override
  Widget buildView(BuildContext context, HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _HomeHeader(),
          SizedBox(height: AppHeights.h24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidths.w20),
            child: Column(
              children: [
                PremiumOfferCard(onTap: controller.onPremiumOfferTap),
                SizedBox(height: AppHeights.h24),
                _Questions(),
                SizedBox(height: AppHeights.h24),
                _Categories(),
                SizedBox(height: AppHeights.h24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends SubView<HomeController> {
  _HomeHeader();

  @override
  Widget buildView(BuildContext context, HomeController controller) {
    final isDarkMode = Provider.of<ThemeProvider>(
      context,
      listen: true,
    ).isDarkMode;
    return Stack(
      children: [
        Positioned(
          bottom: -AppHeights.h10,
          child: Image.asset(
            isDarkMode
                ? Assets.images.home.homeHeaderNoBg.path
                : Assets.images.home.homeHeader.path,
            // This is actually the full width of the screen.
            width: AppWidths.w360,
            height: AppHeights.h200,
            color: isDarkMode ? Theme.of(context).primaryColor : null,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppWidths.w20,
            AppHeights.h22,
            AppWidths.w20,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppHeights.h6),
              Text('Hi, plant lover!', style: context.textTheme.titleSmall),
              SizedBox(height: AppHeights.h4),
              Text(
                'Good Afternoon! ⛅',
                style: context.textTheme.headlineMedium,
              ),
              SizedBox(height: AppHeights.h16),
              CustomSearchBar(
                hintText: 'Search for plants',
                onSearchChanged: controller.onSearchChanged,
              ),
              // This is crucial for background image to be like in the design.
              SizedBox(height: AppHeights.h16),
            ],
          ),
        ),
        Positioned(
          top: AppHeights.h16,
          right: AppWidths.w16,
          child: ThemeToggle(),
        ),
      ],
    );
  }
}

class _Questions extends SubView<HomeController> {
  _Questions();

  @override
  Widget buildView(BuildContext context, HomeController controller) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeQuestionsLoaded ||
          current is HomeQuestionsLoading ||
          current is HomeQuestionsError,
      builder: (context, state) => _buildView(state, controller),
    );
  }

  Widget _buildView(HomeState state, HomeController controller) {
    switch (state) {
      case HomeInitial():
        return const SizedBox.shrink();
      case HomeQuestionsLoading():
        return _QuestionsPlaceholder();
      case HomeQuestionsError():
        return const SizedBox.shrink();
      default:
        final questions = state is HomeQuestionsLoaded
            ? state.questions
            : controller.questions;
        return questions.isEmpty
            ? _QuestionsPlaceholder()
            : SizedBox(
                height: AppHeights.h164,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: questions.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: AppWidths.w10),
                    child: QuestionCard(
                      title: questions[index].title,
                      imageUri: questions[index].imageUri,
                      onTap: () => controller.onQuestionTap(questions[index]),
                    ),
                  ),
                ),
              );
    }
  }
}

class _QuestionsPlaceholder extends StatelessWidget {
  const _QuestionsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      containersColor: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: AppHeights.h164,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: AppWidths.w10),
            child: Card(
              child: SizedBox(
                width: AppWidths.w240,
                height: AppHeights.h164,
                child: ListTile(
                  title: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: AppHeights.h32),
                      child: Text('Item number $index as title'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Categories extends SubView<HomeController> {
  _Categories();

  @override
  Widget buildView(BuildContext context, HomeController controller) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCategoriesLoaded ||
          current is HomeCategoriesLoading ||
          current is HomeCategoriesError,
      builder: (context, state) => _buildView(state, controller),
    );
  }

  Widget _buildView(HomeState state, HomeController controller) {
    switch (state) {
      case HomeInitial():
        return const SizedBox.shrink();
      case HomeCategoriesLoading():
        return _CategoriesPlaceholder();
      case HomeCategoriesError():
        return const SizedBox.shrink();
      default:
        final categories = state is HomeCategoriesLoaded
            ? state.categories
            : controller.categories;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppWidths.w16,
            mainAxisSpacing: AppHeights.h16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryCard(
            title: categories[index].title,
            imageUri: categories[index].image.url,
            onTap: () => controller.onCategoryTap(categories[index]),
          ),
        );
    }
  }
}

class _CategoriesPlaceholder extends StatelessWidget {
  const _CategoriesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      containersColor: Theme.of(context).scaffoldBackgroundColor,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppWidths.w16,
          mainAxisSpacing: AppHeights.h16,
        ),
        itemCount: 6,
        itemBuilder: (context, index) =>
            Card(child: ListTile(title: Text('Item number $index as title'))),
      ),
    );
  }
}
