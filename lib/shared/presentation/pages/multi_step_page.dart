import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/pages/base_page.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

class MultiStepPage extends StatefulWidget {
  const MultiStepPage({
    super.key,
    required this.pages,
    required this.onComplete,
    required this.buttonTexts,
    this.widgetsBelowButton,
    this.initialPage = 0,
    this.allowUserSwipe = true,
  }) : assert(
         buttonTexts.length == pages.length,
         'buttonTexts length must match pages length',
       ),
       assert(
         widgetsBelowButton == null ||
             widgetsBelowButton.length == pages.length,
         'labelsBelowButton length must match pages length when provided',
       );

  /// Ordered list of step widgets.
  final List<Widget> pages;

  /// Button texts corresponding to each page. Must match [pages].length
  final List<String> buttonTexts;

  /// Optional widgets shown below the button per page. If null or an entry is null/empty,
  /// dots indicator will be shown instead for that page.
  final List<Widget?>? widgetsBelowButton;

  /// Called when the user finishes the final step.
  final VoidCallback onComplete;

  /// Initial page index.
  final int initialPage;

  /// Whether users can swipe between steps.
  final bool allowUserSwipe;

  @override
  State<MultiStepPage> createState() => _MultiStepPageState();
}

class _MultiStepPageState extends State<MultiStepPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialPage,
  );
  late int _currentIndex = widget.initialPage.clamp(0, widget.pages.length - 1);

  bool get _isLastPage => _currentIndex >= widget.pages.length - 1;

  Future<void> _goNext() async {
    if (_isLastPage) {
      widget.onComplete();
      return;
    }
    await _pageController.animateToPage(
      _currentIndex + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidget = widget.widgetsBelowButton == null
        ? null
        : widget.widgetsBelowButton![_currentIndex];

    return BasePage(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: widget.allowUserSwipe
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: widget.pages.length,
              itemBuilder: (context, index) => widget.pages[index],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidths.w20),
                child: SizedBox(
                  height: AppHeights.h56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: AppHeights.h16),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppHeights.h12),
                      ),
                    ),
                    onPressed: _goNext,
                    child: Text(
                      widget.buttonTexts[_currentIndex],
                      style: context.textTheme.displayMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppHeights.h16),
              currentWidget != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppWidths.w64),
                      child: SizedBox(
                        height: AppHeights.h30,
                        child: currentWidget,
                      ),
                    )
                  : _PageDots(count: widget.pages.length, index: _currentIndex),
              SizedBox(
                height: currentWidget != null ? AppHeights.h28 : AppHeights.h48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 10 : 6,
          height: isActive ? 10 : 6,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.borderColor
                : AppColors.borderColor.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
