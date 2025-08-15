import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/garden/presentation/controllers/my_garden_controller.dart';

class MyGardenPage extends ControlledView<MyGardenController, Object> {
  MyGardenPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _MyGardenSubView());
  }
}

class _MyGardenSubView extends SubView<MyGardenController> {
  _MyGardenSubView();

  @override
  Widget buildView(BuildContext context, MyGardenController controller) {
    return const Center(child: Text('My Garden'));
  }
}
