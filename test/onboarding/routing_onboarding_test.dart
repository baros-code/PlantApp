// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:plant_app/features/auth/data/services/shared_preferences_manager.dart';
import 'package:plant_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:plant_app/features/auth/domain/usecases/get_onboarding_seen.dart';
import 'package:plant_app/features/auth/presentation/controllers/splash_controller.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:plant_app/features/auth/presentation/pages/splash_page.dart';
import 'package:plant_app/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:plant_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:plant_app/shared/utils/app_router.dart';
import 'package:plant_app/shared/utils/service_locator.dart';

import '../helper.dart';

void main() {
  late AuthCubit authCubit;

  setUp(() {
    // We cant use mock repository and usecases here because
    //they are used in SplashController. So we need to register the real ones.
    locator.registerLazySingleton<SharedPreferencesManager>(
      SharedPreferencesManagerImpl.new,
    );
    locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()),
    );
    locator.registerLazySingleton(() => GetOnboardingSeen(locator()));
    authCubit = AuthCubit(locator(), MockSetOnboardingSeen());
    locator.registerLazySingleton(
      () => OnboardingController(MockLogger(), MockPopupManager()),
    );
    locator.registerLazySingleton(
      () => SplashController(MockLogger(), MockPopupManager()),
    );
    // Set splash duration to 0 for testing, otherwise it throws error.
    locator<SplashController>().setSplashDuration(Duration(milliseconds: 0));
  });

  tearDown(() {
    authCubit.close();
  });

  testWidgets('navigates to OnboardingPage when AuthOnboardingNotSeen', (
    tester,
  ) async {
    final router = GoRouter(
      navigatorKey: AppRouter.rootNavigatorKey,
      initialLocation: AppRoute.splash.path,
      routes: [
        GoRoute(
          path: AppRoute.splash.path,
          builder: (context, state) =>
              BlocProvider.value(value: authCubit, child: SplashPage()),
        ),
        GoRoute(
          path: AppRoute.onboarding.path,
          builder: (context, state) => OnboardingPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        splitScreenMode: false,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pump();

    authCubit.emit(AuthOnboardingNotSeen());
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingPage), findsOneWidget);
  });
}
