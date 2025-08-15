part of 'paywall_cubit.dart';

sealed class PaywallState extends Equatable {
  const PaywallState();

  @override
  List<Object> get props => [];
}

final class PaywallInitial extends PaywallState {}

final class PaywallSubscriptionPlanChanged extends PaywallState {
  const PaywallSubscriptionPlanChanged(this.subscription);

  final SubscriptionPlan subscription;

  @override
  List<Object> get props => [subscription];
}
