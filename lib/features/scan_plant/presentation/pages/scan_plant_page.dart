import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/scan_plant/controllers/scan_plant_controller.dart';

class ScanPlantPage extends ControlledView<ScanPlantController, Object> {
  ScanPlantPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _QrScanSubView());
  }
}

class _QrScanSubView extends SubView<ScanPlantController> {
  _QrScanSubView();

  @override
  Widget buildView(BuildContext context, ScanPlantController controller) {
    return const Center(child: Text('QR Scan'));
  }
}
