import 'package:go_router/go_router.dart';
import 'package:plant_app/shared/utils/app_router.dart';

import '../../../../core/presentation/controller.dart';

class OnboardingController extends Controller<Object> {
  OnboardingController(super.logger, super.popupManager);

  @override
  void onStart() {
    super.onStart();
  }

  void onOnboardingComplete() {
    context.go(AppRoute.home.path);
  }
}
