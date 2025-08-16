import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/controller.dart';
import '../../../../shared/utils/app_router.dart';
import '../cubit/auth_cubit.dart';

class SplashController extends Controller<Object> {
  SplashController(super.logger, super.popupManager);

  Duration splashDuration = Duration(milliseconds: 1200);

  late AuthCubit _authCubit;

  @override
  void onStart() async {
    super.onStart();
    _authCubit = context.read<AuthCubit>();
    // Spend some time to show the splash animation.
    await Future<void>.delayed(splashDuration);
    _authCubit.checkOnboardingSeen();
  }

  void onAuthStateChanged(AuthState state) {
    if (state is AuthOnboardingSeen) {
      context.go(AppRoute.home.path);
    } else {
      context.go(AppRoute.onboarding.path);
    }
  }

  // This is used only for unit testing.
  void setSplashDuration(Duration duration) {
    splashDuration = duration;
  }
}
