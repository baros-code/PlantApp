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
        body: _SplashView(controller.splashDuration),
      ),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView(this.splashDuration);

  final Duration splashDuration;

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.splashDuration,
  );

  late final Animation<double> _logoScale = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
  );

  late final Animation<double> _logoFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
  );

  late final Animation<double> _textFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
  );

  late final Animation<Offset> _textSlide =
      Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _logoFade,
            child: ScaleTransition(
              scale: _logoScale,
              child: Image.asset(
                Assets.icons.splash.splashLogo.path,
                height: AppHeights.h120,
              ),
            ),
          ),
          SizedBox(height: AppHeights.h16),
          FadeTransition(
            opacity: _textFade,
            child: SlideTransition(
              position: _textSlide,
              child: Text(
                'PlantApp',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
