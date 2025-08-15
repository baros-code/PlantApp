import 'package:equatable/equatable.dart';
import 'package:plant_app/features/paywall/domain/entities/premium_feature.dart';
import 'package:plant_app/features/paywall/domain/entities/subscription_plan.dart';

import '../../../../core/presentation/safe_cubit.dart';
import '../../../../gen/assets.gen.dart';

part 'paywall_state.dart';

class PaywallCubit extends SafeCubit<PaywallState> {
  PaywallCubit() : super(PaywallInitial());

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

  // Just a mock data until we have a real data.
  List<SubscriptionPlan> subscriptions = [
    SubscriptionPlan(
      period: '1 month',
      description: r'$2.99/month,',
      secondDescription: ' auto renewable',
      discountText: null,
    ),
    SubscriptionPlan(
      period: '1 year',
      description: r'First 3 days free, then $529,99/year',
      discountText: 'Save 50%',
    ),
  ];

  SubscriptionPlan _selectedPlan = SubscriptionPlan(
    period: '1 year',
    description: r'First 3 days free, then $529,99/year',
    discountText: 'Save 50%',
  );

  SubscriptionPlan get selectedPlan => _selectedPlan;

  void onSubscriptionPlanChanged(SubscriptionPlan subscription) {
    _selectedPlan = subscription;
    emit(PaywallSubscriptionPlanChanged(subscription));
  }
}
