import 'package:json_annotation/json_annotation.dart';

part 'ml_task_similarity_response_dto.g.dart';

@JsonSerializable()
class MlTaskSimilarityResponseDto {
  @JsonKey(name: 'similarity_list')
  final List<List<int>> similarTasks;

  MlTaskSimilarityResponseDto({required this.similarTasks});

  factory MlTaskSimilarityResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MlTaskSimilarityResponseDtoFromJson(json);
}
