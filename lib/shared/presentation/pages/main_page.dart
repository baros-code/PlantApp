import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/app_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.child});

  final StatefulNavigationShell child;

  static final int indexHome = AppRoute.home.tabIndex;
  static final int indexDiagnose = AppRoute.diagnose.tabIndex;
  static final int indexGarden = AppRoute.garden.tabIndex;
  static final int indexProfile = AppRoute.profile.tabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                label: AppRoute.home.label,
                icon: Icons.home_outlined,
                selected: child.currentIndex == indexHome,
                onTap: () => child.goBranch(
                  indexHome,
                  initialLocation: child.currentIndex == indexHome,
                ),
              ),
              _NavItem(
                label: AppRoute.diagnose.label,
                icon: Icons.health_and_safety_outlined,
                selected: child.currentIndex == indexDiagnose,
                onTap: () => child.goBranch(
                  indexDiagnose,
                  initialLocation: child.currentIndex == indexDiagnose,
                ),
              ),
              const SizedBox(width: 56),
              _NavItem(
                label: AppRoute.garden.label,
                icon: Icons.local_florist_outlined,
                selected: child.currentIndex == indexGarden,
                onTap: () => child.goBranch(
                  indexGarden,
                  initialLocation: child.currentIndex == indexGarden,
                ),
              ),
              _NavItem(
                label: AppRoute.profile.label,
                icon: Icons.person_outline,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => child.goBranch(
          AppRoute.qr.tabIndex,
          initialLocation: child.currentIndex == AppRoute.qr.tabIndex,
        ),
        child: const Icon(Icons.qr_code),
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
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppSizes.p72,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            SizedBox(height: AppSizes.p4),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}