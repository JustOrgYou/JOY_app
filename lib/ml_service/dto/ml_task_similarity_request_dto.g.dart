// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_task_similarity_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlTaskSimilarityRequestDto _$MlTaskSimilarityRequestDtoFromJson(
        Map<String, dynamic> json) =>
    MlTaskSimilarityRequestDto(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => MlTaskEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..threshold = (json['threshold'] as num).toDouble();

Map<String, dynamic> _$MlTaskSimilarityRequestDtoToJson(
        MlTaskSimilarityRequestDto instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'threshold': instance.threshold,
    };
