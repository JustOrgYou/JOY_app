import 'package:todo_app/local_storage/domain/local_storage.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

class TaskEntryServiceLocalRemote implements TaskEntryService {
  final LocalStorage local;

  TaskEntryServiceLocalRemote({
    required this.local,
    // required this.remote,
  });
  @override
  Future<void> addTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().putOne(taskEntry);
  }

  @override
  Future<void> deleteTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().deleteOne(taskEntry);
  }

  @override
  Future<List<TaskEntry>> getTaskEntries() async {
    return local.tasksRepository().getAllItems();
  }

  @override
  Stream<List<TaskEntry>> getTaskEntriesStream() {
    return local.tasksRepository().getAllItemsStream();
  }

  @override
  Future<void> updateTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().putOne(taskEntry);
  }
}
