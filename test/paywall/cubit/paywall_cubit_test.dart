// ignore_for_file: prefer-match-file-name

import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/features/paywall/domain/entities/subscription_plan.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_cubit.dart';

void main() {
  late PaywallCubit cubit;

  setUp(() {
    cubit = PaywallCubit();
  });

  tearDown(() async {
    await cubit.close();
  });

  test('initial state is PaywallInitial and default selected plan is set', () {
    expect(cubit.state, isA<PaywallInitial>());
    expect(cubit.selectedPlan.period.isNotEmpty, isTrue);
    expect(cubit.subscriptions, isNotEmpty);
    expect(cubit.premiumFeatures, isNotEmpty);
  });

  test(
    'onSubscriptionPlanChanged emits state and updates selected plan',
    () async {
      final newPlan = SubscriptionPlan(
        period: '1 month',
        description: r'$2.99/month,',
        secondDescription: ' auto renewable',
        discountText: null,
      );

      expectLater(cubit.stream, emits(isA<PaywallSubscriptionPlanChanged>()));

      cubit.onSubscriptionPlanChanged(newPlan);

      expect(cubit.selectedPlan.period, equals('1 month'));
    },
  );
}
