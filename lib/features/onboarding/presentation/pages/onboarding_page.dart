import 'package:flutter/material.dart';

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
    return MultiStepPage(
      pages: [
        OnboardingPageView(
          title: _WelcomeLabel(),
          subTitle: 'Identify more than 3000+ plants and 88% accuracy.',
          backgroundImage: Assets.images.onboarding.onboard1Bg.path,
          bodyImage: Assets.images.onboarding.onboard1.path,
        ),
        OnboardingPageView(
          title: _TitleWithBrushImage(
            prefixText: 'Take a photo to ',
            highlightedText: 'identify',
            suffixText: ' the plant!',
            brushOffset: AppHeights.h24,
          ),
          bodyImage: Assets.images.onboarding.onboard2.path,
          bodyImageWidth: AppWidths.w360,
          bodyImageTopOffset: AppHeights.h80,
        ),
        OnboardingPageView(
          title: _TitleWithBrushImage(
            prefixText: 'Get plant ',
            highlightedText: 'care guides',
            brushOffset: -AppHeights.h10,
          ),
          bodyImage: Assets.images.onboarding.onboard3.path,
        ),
      ],
      buttonTexts: ['Get Started', 'Continue', 'Continue'],
      widgetsBelowButton: [_TermsOfUseLabel(), null, null],
      onComplete: () {},
    );
  }
}

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    required this.title,
    this.subTitle,
    required this.bodyImage,
    this.backgroundImage,
    this.bodyImageWidth,
    this.bodyImageTopOffset,
    super.key,
  });

  final Widget title;
  final String? subTitle;
  final String bodyImage;
  final String? backgroundImage;
  final double? bodyImageWidth;
  final double? bodyImageTopOffset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (backgroundImage != null)
          Image.asset(
            backgroundImage!,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
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
              Align(alignment: Alignment.centerLeft, child: title),
              if (subTitle != null) ...[
                SizedBox(height: AppHeights.h8),
                Text(
                  subTitle!,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: AppColors.borderColor.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ],
          ),
        ),
        Positioned(
          top: bodyImageTopOffset,
          child: Image.asset(bodyImage, width: bodyImageWidth),
        ),
      ],
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

class _TitleWithBrushImage extends StatelessWidget {
  const _TitleWithBrushImage({
    required this.highlightedText,
    this.prefixText,
    this.suffixText,
    this.brushOffset,
  });

  final String highlightedText;
  final String? prefixText;
  final String? suffixText;
  final double? brushOffset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RichText(
          text: TextSpan(
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(text: prefixText),
              TextSpan(
                text: highlightedText,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: suffixText),
            ],
          ),
        ),
        Positioned(
          bottom: brushOffset,
          right: 0,
          child: SizedBox(
            width: AppWidths.w132,
            child: Image.asset(Assets.images.onboarding.onboardBrush.path),
          ),
        ),
      ],
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
