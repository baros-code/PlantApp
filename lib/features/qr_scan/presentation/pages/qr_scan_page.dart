import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/controlled_view.dart';
import 'package:plant_app/core/presentation/sub_view.dart';
import 'package:plant_app/features/qr_scan/controllers/qr_scan_controller.dart';

class QrScanPage extends ControlledView<QrScanController, Object> {
  QrScanPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _QrScanSubView());
  }
}

class _QrScanSubView extends SubView<QrScanController> {
  _QrScanSubView();

  @override
  Widget buildView(BuildContext context, QrScanController controller) {
    return const Center(child: Text('QR Scan'));
  }
}
