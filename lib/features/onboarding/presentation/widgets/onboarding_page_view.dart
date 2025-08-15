import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

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
