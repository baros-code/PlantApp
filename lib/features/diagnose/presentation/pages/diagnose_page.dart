import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/diagnose/presentation/controllers/diagnose_controller.dart';

class DiagnosePage extends ControlledView<DiagnoseController, Object> {
  DiagnosePage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _DiagnoseSubView());
  }
}

class _DiagnoseSubView extends SubView<DiagnoseController> {
  _DiagnoseSubView();

  @override
  Widget buildView(BuildContext context, DiagnoseController controller) {
    return const Center(child: Text('Diagnose'));
  }
}
