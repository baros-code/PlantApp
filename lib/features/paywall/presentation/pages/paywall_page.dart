import 'package:flutter/material.dart';
import 'package:plant_app/shared/presentation/pages/base_page.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../core/presentation/sub_view.dart';
import '../controllers/paywall_controller.dart';

class PaywallPage extends ControlledView<PaywallController, Object> {
  PaywallPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.setOnboardingSeen();
        }
      },
      child: BasePage(body: _PaywallSubView()),
    );
  }
}

class _PaywallSubView extends SubView<PaywallController> {
  _PaywallSubView();

  @override
  Widget buildView(BuildContext context, PaywallController controller) {
    return const Center(child: Text('Paywall'));
  }
}
