import 'package:equatable/equatable.dart';

class SubscriptionPlan extends Equatable {
  const SubscriptionPlan({
    required this.period,
    required this.description,
    this.secondDescription,
    required this.discountText,
  });

  final String period;
  final String description;
  final String? secondDescription;
  final String? discountText;

  @override
  List<Object?> get props => [
    period,
    description,
    secondDescription,
    discountText,
  ];
}
