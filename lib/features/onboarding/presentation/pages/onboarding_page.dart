import 'package:flutter/material.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/title_with_brush_image.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/presentation/pages/multi_step_page.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPage extends ControlledView<OnboardingController, Object> {
  OnboardingPage({super.key, super.params});


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // This manual check is to ensure the image is not too big on big screens.
    // It's preventing image overflow on iphone 16 pro/max and others.
    final isBigScreen = height > 900;
    return MultiStepPage(
      pages: [
        OnboardingPageView(
          title: _WelcomeLabel(),
          subTitle: 'Identify more than 3000+ plants and 88% accuracy.',
          backgroundImage: Assets.images.onboarding.onboard1Bg.path,
          bodyImage: Assets.images.onboarding.onboard1.path,
        ),
        OnboardingPageView(
          title: TitleWithBrushImage(
            prefixText: 'Take a photo to ',
            highlightedText: 'identify',
            suffixText: ' the plant!',
            brushOffset: AppHeights.h24,
          ),
          bodyImage: Assets.images.onboarding.onboard2.path,
          bodyImageWidth: isBigScreen ? AppWidths.w320 : AppWidths.w360,
          bodyImageTopOffset: AppHeights.h80,
        ),
        OnboardingPageView(
          title: TitleWithBrushImage(
            prefixText: 'Get plant ',
            highlightedText: 'care guides',
            brushOffset: -AppHeights.h10,
          ),
          bodyImage: Assets.images.onboarding.onboard3.path,
        ),
      ],
      buttonTexts: ['Get Started', 'Continue', 'Continue'],
      widgetsBelowButton: [_TermsOfUseLabel(), null, null],
      onComplete: controller.onOnboardingComplete,
    );
  }
}

class _WelcomeLabel extends StatelessWidget {
  const _WelcomeLabel();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.headlineLarge,
        children: [
          TextSpan(text: 'Welcome to '),
          TextSpan(
            text: 'PlantApp',
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsOfUseLabel extends StatelessWidget {
  const _TermsOfUseLabel();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: context.textTheme.labelSmall?.copyWith(
          color: AppColors.textDisabled.withValues(alpha: 0.7),
        ),
        children: [
          TextSpan(text: 'By tapping next, you are agreeing to PlantID '),
          TextSpan(
            text: 'Terms of Use',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.textDisabled.withValues(alpha: 0.7),
            ),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
