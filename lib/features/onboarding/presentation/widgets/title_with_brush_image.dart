import 'package:flutter/material.dart';
import 'package:plant_app/gen/assets.gen.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

class TitleWithBrushImage extends StatelessWidget {
  const TitleWithBrushImage({
    super.key,
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
