import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:plant_app/features/paywall/domain/entities/premium_feature.dart';
import 'package:plant_app/gen/assets.gen.dart';

import '../../../../core/presentation/controller.dart';

class PaywallController extends Controller<Object> {
  PaywallController(super.logger, super.popupManager);

  late final AuthCubit _authCubit;

   // Just a mock data until we have a real data.
  List<PremiumFeature> premiumFeatures = [
    PremiumFeature(
      title: 'Unlimited',
      subTitle: 'Plant Identify',
      iconUri: Assets.icons.paywall.unlimitedIcon,
    ),
    PremiumFeature(
      title: 'Faster',
      subTitle: 'Process',
      iconUri: Assets.icons.paywall.fasterIcon,
    ),
    PremiumFeature(
      title: 'Better',
      subTitle: 'Results',
      iconUri: Assets.icons.paywall.betterResultsIcon,
    ),
  ];

  @override
  void onStart() {
    super.onStart();
    _authCubit = context.read<AuthCubit>();
  }

  void setOnboardingSeen() {
    _authCubit.setOnboardingSeen();
  }
}
