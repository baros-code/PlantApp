import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/utils/app_constants.dart';

import '../../domain/entities/question.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  const QuestionModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUri,
    required this.uri,
    required this.order,
  });

  final int? id;
  final String? title;
  final String? subtitle;
  @JsonKey(name: 'image_uri')
  final String? imageUri;
  final String? uri;
  final int? order;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  factory QuestionModel.fromEntity(Question entity) => QuestionModel(
    id: entity.id,
    title: entity.title,
    subtitle: entity.subtitle,
    imageUri: entity.imageUri,
    uri: entity.uri,
    order: entity.order,
  );

  Question toEntity() => Question(
    id: id ?? 0,
    title: title ?? AppConstants.defaultStringValue,
    subtitle: subtitle ?? AppConstants.defaultStringValue,
    imageUri: imageUri ?? AppConstants.defaultStringValue,
    uri: uri ?? AppConstants.defaultStringValue,
    order: order ?? 0,
  );
}
