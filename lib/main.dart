import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_cubit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/network/api_manager.dart';
import 'core/utils/logger.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'shared/theme/theme_provider.dart';
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
      builder: (context, child) => MultiProvider(
        providers: _getProviders(),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            routerConfig: AppRouter.router,
          ),
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

List<SingleChildWidget> _getProviders() {
  return [
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    BlocProvider<AuthCubit>(create: (context) => locator<AuthCubit>()),
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
