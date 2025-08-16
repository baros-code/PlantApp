import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../theme/theme_provider.dart';
import '../../utils/app_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.child});

  final StatefulNavigationShell child;

  static final int indexHome = AppRoute.home.tabIndex!;
  static final int indexDiagnose = AppRoute.diagnose.tabIndex!;
  static final int indexGarden = AppRoute.garden.tabIndex!;
  static final int indexProfile = AppRoute.profile.tabIndex!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: AppHeights.h80,
        shape: const CircularNotchedRectangle(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.borderColor.withValues(alpha: 0.1),
                width: AppWidths.w1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                label: AppRoute.home.label,
                icon: Assets.icons.home.homeIcon,
                selected: child.currentIndex == indexHome,
                onTap: () => child.goBranch(
                  indexHome,
                  initialLocation: child.currentIndex == indexHome,
                ),
              ),
              _NavItem(
                label: AppRoute.diagnose.label,
                icon: Assets.icons.home.diagnoseIcon,
                selected: child.currentIndex == indexDiagnose,
                onTap: () => child.goBranch(
                  indexDiagnose,
                  initialLocation: child.currentIndex == indexDiagnose,
                ),
              ),
              SizedBox(width: AppWidths.w56),
              _NavItem(
                label: AppRoute.garden.label,
                icon: Assets.icons.home.myGardenIcon,
                selected: child.currentIndex == indexGarden,
                onTap: () => child.goBranch(
                  indexGarden,
                  initialLocation: child.currentIndex == indexGarden,
                ),
              ),
              _NavItem(
                label: AppRoute.profile.label,
                icon: Assets.icons.home.profileIcon,
                selected: child.currentIndex == indexProfile,
                onTap: () => child.goBranch(
                  indexProfile,
                  initialLocation: child.currentIndex == indexProfile,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _ScanQRButton(),
    );
  }
}

class _ScanQRButton extends StatelessWidget {
  const _ScanQRButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoute.scanPlant.path),
      child: Container(
        padding: EdgeInsets.all(AppSizes.p20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          border: Border.all(
            color: AppColors.white.withValues(alpha: .24),
            width: AppWidths.w4,
          ),
        ),
        child: SvgPicture.asset(
          Assets.icons.home.scanIcon,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          width: AppWidths.w26,
          height: AppHeights.h26,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(
      context,
      listen: true,
    ).isDarkMode;
    final color = selected
        ? isDarkMode
              ? AppColors.white
              : AppColors.primary
        : isDarkMode
        ? AppColors.black
        : AppColors.iconSecondary;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppWidths.w74,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              width: AppWidths.w26,
              height: AppHeights.h26,
            ),
            SizedBox(height: AppHeights.h5),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
