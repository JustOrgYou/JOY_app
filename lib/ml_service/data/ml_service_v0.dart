import 'package:dio/dio.dart';
import 'package:todo_app/ml_service/domain/ml_service.dart';
import 'package:todo_app/ml_service/dto/ml_task_entry_dto.dart';
import 'package:todo_app/ml_service/dto/ml_task_similarity_request_dto.dart';
import 'package:todo_app/ml_service/dto/ml_task_similarity_response_dto.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

typedef _Json = Map<String, dynamic>;

class MlServiceV0 implements MlService {
  final Dio dio;

  const MlServiceV0({required this.dio});

  @override
  Future<List<List<int>>> getSimilarTasksIds(List<TaskEntry> tasks) async {
    final response = await dio.post<_Json>(
      '/tasks',
      data: MlTaskSimilarityRequestDto(
        tasks: tasks.map(MlTaskEntryDto.fromTaskEntry).toList(),
      ).toJson(),
    );
    final parsed = MlTaskSimilarityResponseDto.fromJson(response.data!);
    return parsed.similarTasks;
  }
}
