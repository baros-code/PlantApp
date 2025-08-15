import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/controller.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../domain/entities/premium_feature.dart';
import '../../domain/entities/subscription_plan.dart';
import '../cubit/paywall_cubit.dart';

class PaywallController extends Controller<Object> {
  PaywallController(super.logger, super.popupManager);

  late AuthCubit _authCubit;
  late PaywallCubit _paywallCubit;

  List<PremiumFeature> get premiumFeatures => _paywallCubit.premiumFeatures;
  List<SubscriptionPlan> get subscriptions => _paywallCubit.subscriptions;

  SubscriptionPlan get selectedPlan => _paywallCubit.selectedPlan;

  @override
  void onStart() {
    super.onStart();
    _authCubit = context.read<AuthCubit>();
    _paywallCubit = context.read<PaywallCubit>();
  }

  void setOnboardingSeen() {
    _authCubit.setOnboardingSeen();
  }

  void onSubscriptionTap(SubscriptionPlan subscription) {
    _paywallCubit.onSubscriptionPlanChanged(subscription);
  }
}
