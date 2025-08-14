import 'package:flutter/material.dart';
import 'package:plant_app/shared/utils/service_locator.dart';

void main() {
  _initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}

void _initializeDependencies() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.initialize();
}
