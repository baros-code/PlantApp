import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/home/presentation/controllers/home_controller.dart';

class HomePage extends ControlledView<HomeController, Object> {
  HomePage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeSubView());
  }
}

class _HomeSubView extends SubView<HomeController> {
  _HomeSubView();

  @override
  Widget buildView(BuildContext context, HomeController controller) {
    return const Center(child: Text('Home'));
  }
}
