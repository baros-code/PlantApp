import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        onTap?.call();
      },
      child: Container(
        width: AppWidths.w24,
        height: AppHeights.h24,
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.4),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          Assets.icons.paywall.closeIcon,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
