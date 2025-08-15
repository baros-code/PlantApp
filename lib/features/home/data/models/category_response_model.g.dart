// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseModel _$CategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => CategoryResponseModel(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : PaginationModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryResponseModelToJson(
  CategoryResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};
