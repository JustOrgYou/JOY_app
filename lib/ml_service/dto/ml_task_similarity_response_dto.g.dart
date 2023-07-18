// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_task_similarity_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlTaskSimilarityResponseDto _$MlTaskSimilarityResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MlTaskSimilarityResponseDto(
      similarTasks: (json['similarity_list'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
          .toList(),
    );

Map<String, dynamic> _$MlTaskSimilarityResponseDtoToJson(
        MlTaskSimilarityResponseDto instance) =>
    <String, dynamic>{
      'similarity_list': instance.similarTasks,
    };
