import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/controller.dart';
import '../../../../shared/utils/app_router.dart';
import '../cubit/auth_cubit.dart';

class SplashController extends Controller<Object> {
  SplashController(super.logger, super.popupManager);

  late AuthCubit _authCubit;

  @override
  void onStart() async {
    super.onStart();
    _authCubit = context.read<AuthCubit>();
    // Spend some time to show the logo.
    await Future<void>.delayed(const Duration(seconds: 1));
    _authCubit.checkOnboardingSeen();
  }

  void onAuthStateChanged(AuthState state) {
    // if (state is AuthOnboardingSeen) {
    //   context.go(AppRoute.home.path);
    // } else {
    //   context.go(AppRoute.onboarding.path);
    // }
  }
}
