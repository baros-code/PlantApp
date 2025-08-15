import 'package:flutter/material.dart';
import 'package:plant_app/features/paywall/domain/entities/subscription_plan.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard(
    this.subscription, {
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final SubscriptionPlan subscription;
  final bool isSelected;
  final void Function(SubscriptionPlan) onTap;

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant SubscriptionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _isSelected = widget.isSelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            widget.onTap(widget.subscription);
          },
          child: Container(
            width: double.infinity,
            height: AppHeights.h64,
            padding: EdgeInsets.all(AppSizes.p14),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(AppSizes.p14),
              border: Border.all(
                color: _isSelected
                    ? Theme.of(context).primaryColor
                    : AppColors.white.withValues(alpha: 0.3),
                width: _isSelected ? AppWidths.w1_5 : AppWidths.w0_5,
              ),
            ),
            child: Row(
              children: [
                _RadioButton(_isSelected),
                SizedBox(width: AppWidths.w12),
                _SubscriptionLabels(widget.subscription),
              ],
            ),
          ),
        ),
        if (widget.subscription.discountText != null)
          _DiscountLabel(widget.subscription.discountText!),
      ],
    );
  }
}

class _DiscountLabel extends StatelessWidget {
  const _DiscountLabel(this.discountText);

  final String discountText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          AppWidths.w10,
          AppHeights.h4,
          AppSizes.p14,
          AppHeights.h4,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSizes.p20),
            topRight: Radius.circular(AppSizes.p14),
          ),
        ),
        child: Text(
          discountText,
          style: context.textTheme.labelLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _SubscriptionLabels extends StatelessWidget {
  const _SubscriptionLabels(this.subscription);

  final SubscriptionPlan subscription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subscription.period,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: AppHeights.h14,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: subscription.description,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                TextSpan(
                  text: subscription.secondDescription,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RadioButton extends StatelessWidget {
  const _RadioButton(this.isSelected);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: AppWidths.w24,
          height: AppHeights.h24,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : AppColors.white.withValues(alpha: 0.08),
            shape: BoxShape.circle,
          ),
        ),
        if (isSelected)
          Container(
            width: AppWidths.w8,
            height: AppHeights.h8,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
