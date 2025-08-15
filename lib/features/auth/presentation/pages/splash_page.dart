import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../shared/presentation/pages/base_page.dart';
import '../controllers/splash_controller.dart';
import '../cubit/auth_cubit.dart';

class SplashPage extends ControlledView<SplashController, Object> {
  SplashPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => controller.onAuthStateChanged(state),
      child: BasePage(body: _SplashView()),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Splash'));
  }
}
