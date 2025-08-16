import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/presentation/pages/base_page.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/theme/app_colors.dart';
import '../controllers/splash_controller.dart';
import '../cubit/auth_cubit.dart';

class SplashPage extends ControlledView<SplashController, Object> {
  SplashPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => controller.onAuthStateChanged(state),
      child: BasePage(
        backgroundColor: Theme.of(context).primaryColor,
        body: _SplashView(),
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.icons.splash.splashLogo.path,
            height: AppHeights.h120,
          ),
          SizedBox(height: AppSizes.p16),
          Text(
            'PlantApp',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
