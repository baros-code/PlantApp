import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/utils/app_constants.dart';
import '../../domain/entities/custom_image.dart';

part 'custom_image_model.g.dart';

@JsonSerializable()
class CustomImageModel {
  const CustomImageModel({
    required this.id,
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
  });

  final int? id;
  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final dynamic formats;
  final String? previewUrl;
  final String? provider;
  @JsonKey(name: 'provider_metadata')
  final dynamic providerMetadata;

  factory CustomImageModel.fromJson(Map<String, dynamic> json) =>
      _$CustomImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomImageModelToJson(this);

  factory CustomImageModel.fromEntity(CustomImage entity) => CustomImageModel(
    id: entity.id,
    name: entity.name,
    hash: entity.hash,
    ext: entity.ext,
    mime: entity.mime,
    size: entity.size,
    url: entity.url,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    alternativeText: entity.alternativeText,
    caption: entity.caption,
    width: entity.width,
    height: entity.height,
    formats: entity.formats,
    previewUrl: entity.previewUrl,
    provider: entity.provider,
    providerMetadata: entity.providerMetadata,
  );

  CustomImage toEntity() => CustomImage(
    id: id ?? 0,
    name: name ?? AppConstants.defaultStringValue,
    hash: hash ?? AppConstants.defaultStringValue,
    ext: ext ?? AppConstants.defaultStringValue,
    mime: mime ?? AppConstants.defaultStringValue,
    size: size ?? 0,
    url: url ?? AppConstants.defaultStringValue,
    createdAt: createdAt,
    updatedAt: updatedAt,
    alternativeText: alternativeText,
    caption: caption,
    width: width,
    height: height,
    formats: formats,
    previewUrl: previewUrl,
    provider: provider,
    providerMetadata: providerMetadata,
  );
}
