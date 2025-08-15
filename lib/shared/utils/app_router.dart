import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/diagnose/presentation/pages/diagnose_page.dart';
import '../../features/garden/presentation/pages/my_garden_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/scan_plant/presentation/pages/scan_plant_page.dart';
import '../presentation/pages/main_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.splash.path,
    routes: [
      // Splash
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.routeName,
        builder: (context, state) => SplashPage(),
      ),
      // Onboarding
      GoRoute(
        path: AppRoute.onboarding.path,
        name: AppRoute.onboarding.routeName,
        builder: (context, state) => OnboardingPage(),
      ),
      // Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainPage(child: navigationShell);
        },
        branches: [
          // Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                name: AppRoute.home.routeName,
                builder: (context, state) => HomePage(),
              ),
            ],
          ),
          // Diagnose
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.diagnose.path,
                name: AppRoute.diagnose.routeName,
                builder: (context, state) => DiagnosePage(),
              ),
            ],
          ),
          // My Garden
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.garden.path,
                name: AppRoute.garden.routeName,
                builder: (context, state) => MyGardenPage(),
              ),
            ],
          ),
          // Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.profile.path,
                name: AppRoute.profile.routeName,
                builder: (context, state) => ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      // Scan Plant
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: AppRoute.scanPlant.path,
        name: AppRoute.scanPlant.routeName,
        builder: (context, state) => ScanPlantPage(),
      ),
    ],
  );
}

enum AppRoute {
  splash('/splash', 'splash', 'Splash'),
  onboarding('/onboarding', 'onboarding', 'Onboarding'),
  home('/home', 'home', 'Home', tabIndex: 0),
  diagnose('/diagnose', 'diagnose', 'Diagnose', tabIndex: 1),
  garden('/garden', 'garden', 'My Garden', tabIndex: 2),
  profile('/profile', 'profile', 'Profile', tabIndex: 3),
  scanPlant('/scan_plant', 'scan_plant', 'Scan Plant');

  const AppRoute(this.path, this.routeName, this.label, {this.tabIndex});

  final String path;
  final String routeName;
  final int? tabIndex;
  final String label;

  static AppRoute? fromPath(String path) {
    for (final route in AppRoute.values) {
      if (route.path == path) return route;
    }
    return null;
  }
}
