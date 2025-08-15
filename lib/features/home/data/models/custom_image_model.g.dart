// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomImageModel _$CustomImageModelFromJson(Map<String, dynamic> json) =>
    CustomImageModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      alternativeText: json['alternativeText'] as String?,
      caption: json['caption'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      formats: json['formats'],
      previewUrl: json['previewUrl'] as String?,
      provider: json['provider'] as String?,
      providerMetadata: json['provider_metadata'],
    );

Map<String, dynamic> _$CustomImageModelToJson(CustomImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'provider_metadata': instance.providerMetadata,
    };
