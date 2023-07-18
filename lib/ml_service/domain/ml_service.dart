import 'package:todo_app/tasks_service/domain/task_entry.dart';

abstract interface class MlService {
  Future<List<List<int>>> getSimilarTasksIds(List<TaskEntry> tasks);
}
