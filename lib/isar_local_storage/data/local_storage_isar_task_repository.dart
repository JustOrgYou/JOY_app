import 'package:isar/isar.dart';
import 'package:todo_app/isar_local_storage/domain/isar_task_entry.dart';
import 'package:todo_app/shared/domain/streaming_crud_repository.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class IsarTaskEntrysRepository implements StreamingCrudRepository<TaskEntry> {
  final Isar isar;
  Stream<List<TaskEntry>>? _stream;

  IsarTaskEntrysRepository({
    required this.isar,
  });

  @override
  Future<void> clearItems() async {
    await isar.isarTaskEntrys.clear();
  }

  @override
  Future<void> putMany(List<TaskEntry> tasks) async {
    await isar.writeTxn(
      () => isar.isarTaskEntrys.putAll(
        tasks.map(IsarTaskEntry.fromTaskEntry).toList(),
      ),
    );
  }

  @override
  Future<void> putOne(TaskEntry task) async {
    await isar.writeTxn<void>(
      () => isar.isarTaskEntrys.put(
        IsarTaskEntry.fromTaskEntry(task),
      ),
    );
  }

  @override
  Future<List<TaskEntry>> deleteMany(List<TaskEntry> tasks) async {
    final ids = tasks.map((e) => e.id).toList();
    final deleted = await isar.isarTaskEntrys.getAll(ids);
    await isar.writeTxn(() => isar.isarTaskEntrys.deleteAll(ids));
    return deleted.nonNulls
        .map(
          (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
        )
        .toList();
  }

  @override
  Future<bool> deleteOne(TaskEntry task) async {
    return isar.writeTxn<bool>(() => isar.isarTaskEntrys.delete(task.id));
  }

  @override
  Future<List<TaskEntry>> getAllItems() async {
    final isarTaskEntrys = await isar.isarTaskEntrys.where().findAll();

    return isarTaskEntrys
        .map<TaskEntry>(
          (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
        )
        .toList();
  }

  @override
  Stream<List<TaskEntry>> getAllItemsStream() {
    _stream ??= isar.isarTaskEntrys.where().watch(fireImmediately: true).map(
          (isarTaskEntrys) => isarTaskEntrys
              .map<TaskEntry>(
                (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
              )
              .toList(),
        );
    return _stream!;
  }
}
