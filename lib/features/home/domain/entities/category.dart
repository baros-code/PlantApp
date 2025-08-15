import 'package:equatable/equatable.dart';

import 'custom_image.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.title,
    required this.rank,
    required this.image,
  });

  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String title;
  final int rank;
  final CustomImage image;

  @override
  List<Object?> get props => [
    id,
    name,
    createdAt,
    updatedAt,
    publishedAt,
    title,
    rank,
    image,
  ];
}
