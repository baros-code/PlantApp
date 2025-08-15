import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/utils/app_constants.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/custom_image.dart';
import 'custom_image_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.title,
    required this.rank,
    required this.image,
  });

  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? title;
  final int? rank;
  final CustomImageModel? image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  factory CategoryModel.fromEntity(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      publishedAt: entity.publishedAt,
      title: entity.title,
      rank: entity.rank,
      image: CustomImageModel.fromEntity(entity.image),
    );
  }

  Category toEntity() {
    return Category(
      id: id ?? 0,
      name: name ?? AppConstants.defaultStringValue,
      createdAt: createdAt,
      updatedAt: updatedAt,
      publishedAt: publishedAt,
      title: title ?? AppConstants.defaultStringValue,
      rank: rank ?? 0,
      image: image?.toEntity() ?? CustomImage.initial(),
    );
  }
}
