import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/gen/assets.gen.dart';
import 'package:plant_app/shared/presentation/widgets/custom_card.dart';
import 'package:plant_app/shared/presentation/widgets/gradient_text.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

class PremiumOfferCard extends StatelessWidget {
  const PremiumOfferCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t1 = AppColors.premiumCardTitleColorFirst;
    final t2 = AppColors.premiumCardTitleColorSecond;
    final s1 = AppColors.premiumCardSubtitleColorFirst;
    final s2 = AppColors.premiumCardSubtitleColorSecond;
    return CustomCard(
      padding: EdgeInsets.fromLTRB(
        AppWidths.w16,
        AppHeights.h12,
        AppWidths.w10,
        AppHeights.h12,
      ),
      width: AppWidths.w320,
      height: AppHeights.h64,
      enableShadows: false,
      showArrowIcon: true,
      arrowIconColor: AppColors.premiumCardArrowIconColor,
      backgroundColor: AppColors.premiumCardColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(Assets.icons.home.messageIcon, fit: BoxFit.cover),
          SizedBox(width: AppWidths.w12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientTextSpan(
                children: [
                  TextSpan(
                    text: 'FREE',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' Premium Available',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    t1,
                    Color.lerp(t1, t2, 0.1)!,
                    Color.lerp(t1, t2, 0.5)!,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              GradientText(
                'Tap to upgrade your account!',
                gradient: LinearGradient(
                  colors: [
                    Color.lerp(s1, s2, 0.1)!,
                    Color.lerp(s1, s2, 0.5)!,
                    Color.lerp(s1, s2, 1)!,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
