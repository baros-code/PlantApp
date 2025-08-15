import 'package:equatable/equatable.dart';

class PremiumFeature extends Equatable {
  const PremiumFeature({
    required this.title,
    required this.subTitle,
    required this.iconUri,
  });

  final String title;
  final String subTitle;
  final String iconUri;

  @override
  List<Object?> get props => [title, subTitle, iconUri];
}
