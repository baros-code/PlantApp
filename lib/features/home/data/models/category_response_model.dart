import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category_response.dart';
import '../../domain/entities/pagination.dart';
import 'category_model.dart';
import 'pagination_model.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  const CategoryResponseModel({required this.data, required this.meta});

  final List<CategoryModel>? data;
  final PaginationModel? meta;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);

  factory CategoryResponseModel.fromEntity(CategoryResponse entity) {
    return CategoryResponseModel(
      data: entity.data.map(CategoryModel.fromEntity).toList(),
      meta: PaginationModel.fromEntity(entity.meta),
    );
  }

  CategoryResponse toEntity() {
    return CategoryResponse(
      data: data?.map((e) => e.toEntity()).toList() ?? [],
      meta:
          meta?.toEntity() ??
          Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0),
    );
  }
}
