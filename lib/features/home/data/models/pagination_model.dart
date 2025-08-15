import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagination.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationModel {
  const PaginationModel({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);

  factory PaginationModel.fromEntity(Pagination entity) {
    return PaginationModel(
      page: entity.page,
      pageSize: entity.pageSize,
      pageCount: entity.pageCount,
      total: entity.total,
    );
  }

  Pagination toEntity() {
    return Pagination(
      page: page ?? 0,
      pageSize: pageSize ?? 0,
      pageCount: pageCount ?? 0,
      total: total ?? 0,
    );
  }
}
