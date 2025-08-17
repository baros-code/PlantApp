import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';

class TitleWithBrushImage extends StatelessWidget {
  const TitleWithBrushImage({
    super.key,
    required this.highlightedText,
    this.prefixText,
    this.suffixText,
    this.brushOffsetRight,
    this.brushWidth,
  });

  final String highlightedText;
  final String? prefixText;
  final String? suffixText;
  final double? brushOffsetRight;
  final double? brushWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: RichText(
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
        ),
        Positioned(
          top: AppHeights.h4,
          right: brushOffsetRight,
          child: SizedBox(
            width: brushWidth,
            height: AppHeights.h80,
            child: Image.asset(Assets.images.onboarding.onboardBrush.path),
          ),
        ),
      ],
    );
  }
}
