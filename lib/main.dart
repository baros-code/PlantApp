import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/network/api_manager.dart';
import 'core/utils/logger.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/paywall/presentation/cubit/paywall_cubit.dart';
import 'shared/theme/app_theme.dart';
import 'shared/utils/app_constants.dart';
import 'shared/utils/app_router.dart';
import 'shared/utils/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      // Initialize the app components.
      _initializeDependencies();
      // Handle Flutter errors.
      FlutterError.onError = _onFlutterError;
      // Run the app.
      runApp(MainApp());
    },
    // Handle Dart errors.
    _onDartError,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      // This is important to avoid reading screen size as zero or incorrect.
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: _getCubitProviders(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}

// Helpers
void _initializeDependencies() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.initialize();
  locator<ApiManager>().setup(AppConstants.apiSetupParams);
}

List<BlocProvider> _getCubitProviders() {
  return [
    BlocProvider<AuthCubit>(create: (context) => locator<AuthCubit>()),
    BlocProvider<HomeCubit>(create: (context) => locator<HomeCubit>()),
    BlocProvider<PaywallCubit>(create: (context) => locator<PaywallCubit>()),
  ];
}

void _onFlutterError(FlutterErrorDetails details) {
  FlutterError.presentError(details);
  locator<Logger>().error(
    '${details.exceptionAsString()}\n${details.stack.toString()}',
  );
}

void _onDartError(Object error, StackTrace stackTrace) {
  locator<Logger>().error('${error.toString()}\n${stackTrace.toString()}');
}

// - Helpers
