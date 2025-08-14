import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_theme.dart';

import 'shared/utils/service_locator.dart';

void main() {
  _initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}

void _initializeDependencies() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.initialize();
}
