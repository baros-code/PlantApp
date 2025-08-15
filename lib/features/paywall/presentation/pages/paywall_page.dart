import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/controlled_view.dart';
import '../../../../core/presentation/sub_view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/presentation/pages/base_page.dart';
import '../../../../shared/presentation/widgets/custom_close_button.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';
import '../../domain/entities/premium_feature.dart';
import '../../domain/entities/subscription_plan.dart';

import '../controllers/paywall_controller.dart';
import '../cubit/paywall_cubit.dart';
import '../widgets/feature_card.dart';
import '../widgets/subscription_card.dart';

class PaywallPage extends ControlledView<PaywallController, Object> {
  PaywallPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.setOnboardingSeen();
        }
      },
      child: BasePage(
        appBarBackgroundColor: AppColors.paywallBgColor,
        backgroundColor: AppColors.paywallBgColor,
        body: _PaywallView(),
      ),
    );
  }
}

class _PaywallView extends SubView<PaywallController> {
  _PaywallView();

  @override
  Widget buildView(BuildContext context, PaywallController controller) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: AppHeights.h300,
          child: Image.asset(Assets.images.paywall.paywallBg.path),
        ),
        Positioned(
          top: AppHeights.h14,
          right: AppWidths.w20,
          child: CustomCloseButton(onTap: controller.setOnboardingSeen),
        ),
        Positioned(
          left: AppWidths.w20,
          top: AppHeights.h256,
          right: AppWidths.w20,
          child: _PaywallBody(),
        ),
      ],
    );
  }
}

class _PaywallBody extends SubView<PaywallController> {
  _PaywallBody();

  @override
  Widget buildView(BuildContext context, PaywallController controller) {
    final features = controller.premiumFeatures;
    final subscriptions = controller.subscriptions;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(),
        SizedBox(height: AppHeights.h20),
        _FeaturesSection(features),
        SizedBox(height: AppHeights.h20),
        _SubscriptionsList(subscriptions: subscriptions),
        SizedBox(height: AppHeights.h20),
        PrimaryButton(text: 'Try free for 3 days', onPressed: () {}),
        SizedBox(height: AppHeights.h10),
        _TermsAndConditions(),
        SizedBox(height: AppHeights.h20),
      ],
    );
  }
}

class _SubscriptionsList extends SubView<PaywallController> {
  _SubscriptionsList({required this.subscriptions});

  final List<SubscriptionPlan> subscriptions;

  @override
  Widget buildView(BuildContext context, PaywallController controller) {
    return BlocBuilder<PaywallCubit, PaywallState>(
      buildWhen: (previous, current) =>
          current is PaywallSubscriptionPlanChanged,
      builder: (context, state) {
        final selectedPlan = state is PaywallSubscriptionPlanChanged
            ? state.subscription
            : controller.selectedPlan;
        return Column(
          children: [
            ...subscriptions.map(
              (e) => Padding(
                padding: EdgeInsets.only(
                  bottom: subscriptions.last == e ? 0 : AppHeights.h16,
                ),
                child: SubscriptionCard(
                  e,
                  onTap: controller.onSubscriptionTap,
                  isSelected: e.period == selectedPlan.period,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'PlantApp',
              style: context.textTheme.headlineLarge?.copyWith(
                fontSize: AppFontSizes.size30,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: AppWidths.w6),
            Text(
              'Premium',
              style: context.textTheme.headlineLarge?.copyWith(
                fontSize: AppFontSizes.size27,
                color: AppColors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Text(
          'Access All Features',
          style: context.textTheme.displayMedium?.copyWith(
            color: AppColors.white.withValues(alpha: 0.7),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection(this.features);

  final List<PremiumFeature> features;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeights.h124,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: features.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: AppWidths.w8),
          child: FeatureCard(
            title: features[index].title,
            subTitle: features[index].subTitle,
            iconUri: features[index].iconUri,
          ),
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '''After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable''',
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: AppFontSizes.size9,
            color: AppColors.white.withValues(alpha: 0.52),
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: AppHeights.h8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terms  •  Privacy  •  Restore',
              style: context.textTheme.labelSmall?.copyWith(
                color: AppColors.white.withValues(alpha: 0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
