import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconUri,
  });
  final String title;
  final String subTitle;
  final String iconUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.p14),
      ),
      width: AppWidths.w155,
      height: AppHeights.h124,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IconCard(iconUri),
          SizedBox(height: AppHeights.h10),
          Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: AppHeights.h4),
          Text(
            subTitle,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCard extends StatelessWidget {
  const _IconCard(this.iconUri);

  final String iconUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p8),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.24),
        borderRadius: BorderRadius.circular(AppSizes.p8),
      ),
      child: SvgPicture.asset(
        iconUri,
        width: AppWidths.w18,
        height: AppHeights.h18,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    );
  }
}
