import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/features/diagnose/presentation/pages/diagnose_page.dart';
import 'package:plant_app/features/garden/presentation/pages/my_garden_page.dart';
import 'package:plant_app/features/home/presentation/pages/home_page.dart';
import 'package:plant_app/features/profile/presentation/pages/profile_page.dart';
import 'package:plant_app/features/qr_scan/presentation/pages/qr_scan_page.dart';
import 'package:plant_app/shared/presentation/pages/main_page.dart';

class AppRouter {
  static GoRouter create() {
    final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

    final router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoute.home.path,
      routes: [
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
            // QRScan
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoute.qr.path,
                  name: AppRoute.qr.routeName,
                  builder: (context, state) => QrScanPage(),
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
      ],
    );
    return router;
  }
}

enum AppRoute {
  home('/home', 'home', 0, 'Home'),
  diagnose('/diagnose', 'diagnose', 1, 'Diagnose'),
  qr('/qr', 'qr', 2, 'QR'),
  garden('/garden', 'garden', 3, 'My Garden'),
  profile('/profile', 'profile', 4, 'Profile');

  const AppRoute(this.path, this.routeName, this.tabIndex, this.label);

  final String path;
  final String routeName;
  final int tabIndex;
  final String label;

  static AppRoute? fromPath(String path) {
    for (final route in AppRoute.values) {
      if (route.path == path) return route;
    }
    return null;
  }
}
