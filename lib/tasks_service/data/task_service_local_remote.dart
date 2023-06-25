import 'package:todo_app/local_storage/domain/local_storage.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

class TaskEntryServiceLocalRemote implements TaskEntryService {
  /// repository that is used for persistent app state management
  final LocalStorage local;

  /// remote server api that sync data across devices
  final NetworkRepository<TaskEntry> remote;

  TaskEntryServiceLocalRemote({
    required this.remote,
    required this.local,
    // required this.remote,
  });

  @override
  Future<void> addTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().createOne(taskEntry);
    await remote.createOne(taskEntry);
  }

  @override
  Future<void> deleteTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().deleteOne(taskEntry);
    await remote.deleteOne(taskEntry);
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
    await local.tasksRepository().updateOne(taskEntry);
    await remote.updateOne(taskEntry);
  }

  @override
  Future<void> deleteAllTaskEntries() async {
    await local.tasksRepository().clearItems();
    await remote.clearItems();
  }

  /// currently syncronization is server responsibility and remote dominate over local.
  @override
  Future<void> syncronizeTaskEntries() async {
    final localTaskEntries = await local.tasksRepository().getAllItems();
    await remote.patch(localTaskEntries);
    final remoteItems = await remote.getAllItems();
    await local.tasksRepository().clearItems();
    await local.tasksRepository().createMany(remoteItems);
  }
}
