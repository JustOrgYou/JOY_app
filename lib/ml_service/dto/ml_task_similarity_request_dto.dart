import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/ml_service/dto/ml_task_entry_dto.dart';

part 'ml_task_similarity_request_dto.g.dart';

@JsonSerializable()
class MlTaskSimilarityRequestDto {
  List<MlTaskEntryDto> tasks;
  double threshold;

  MlTaskSimilarityRequestDto({
    required this.tasks,
    // required this.threshold,
  }) : threshold = 0.7;

  factory MlTaskSimilarityRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MlTaskSimilarityRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MlTaskSimilarityRequestDtoToJson(this);
}
