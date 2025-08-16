// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:plant_app/features/auth/domain/usecases/get_onboarding_seen.dart';
import 'package:plant_app/features/auth/domain/usecases/set_onboarding_seen.dart';
import 'package:plant_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:plant_app/core/utils/result.dart';
import 'package:plant_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:plant_app/features/auth/presentation/pages/splash_page.dart';
import 'package:plant_app/shared/utils/app_router.dart';
import 'package:plant_app/shared/utils/service_locator.dart';
import 'package:plant_app/core/utils/logger.dart';
import 'package:plant_app/core/utils/popup_manager.dart';
import 'package:plant_app/features/auth/presentation/controllers/splash_controller.dart';

import '../helper.dart';

class _AuthCubitTest extends AuthCubit {
  _AuthCubitTest()
    : super(
        // Provide no-op usecases via simple subclasses
        _NoopGetOnboardingSeen(),
        _NoopSetOnboardingSeen(),
      );
}

class _NoopGetOnboardingSeen extends GetOnboardingSeen {
  _NoopGetOnboardingSeen() : super(_NoopAuthRepository());
}

class _NoopSetOnboardingSeen extends SetOnboardingSeen {
  _NoopSetOnboardingSeen() : super(_NoopAuthRepository());
}

class _NoopAuthRepository implements AuthRepository {
  @override
  Future<Result<bool, Failure>> getOnboardingSeen() async =>
      Result<bool, Failure>.success(value: false);

  @override
  Future<Result<Object, Failure>> setOnboardingSeen() async =>
      Result<Object, Failure>.success();
}

void main() {
  testWidgets('navigates to OnboardingPage when AuthOnboardingNotSeen', (
    tester,
  ) async {
    final authCubit = _AuthCubitTest();

    locator.registerLazySingleton(
      () => AuthCubit(_NoopGetOnboardingSeen(), _NoopSetOnboardingSeen()),
    );
    locator.registerSingleton<Logger>(LoggerImpl());
    locator.registerSingleton<PopupManager>(PopupManagerImpl());
    locator.registerLazySingleton(
      () => SplashController(MockLogger(), MockPopupManager()),
    );

    final router = GoRouter(
      navigatorKey: AppRouter.rootNavigatorKey,
      initialLocation: AppRoute.splash.path,
      routes: [
        GoRoute(
          path: AppRoute.splash.path,
          builder: (context, state) => BlocProvider(
            create: (_) => locator<AuthCubit>(),
            child: SplashPage(),
          ),
        ),
        GoRoute(
          path: AppRoute.onboarding.path,
          builder: (context, state) => OnboardingPage(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    // Simulate state change from cubit
    authCubit.emit(AuthOnboardingNotSeen());
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingPage), findsOneWidget);
  });
}

class _TestSplashController extends SplashController {
  _TestSplashController() : super(LoggerImpl(), PopupManagerImpl());

  @override
  void onStart() {
    // no-op to avoid delays and side effects in tests
  }
}
