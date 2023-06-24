import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/isar_local_storage/data/local_storage_isar_task_repository.dart';
import 'package:todo_app/isar_local_storage/domain/isar_task_entry.dart';
import 'package:todo_app/local_storage/domain/crud_repository.dart';
import 'package:todo_app/local_storage/domain/local_storage.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class LocalStorageIsar implements LocalStorage {
  late final Isar _isar;
  late final CrudRepository<TaskEntry> _tasksRepository;

  @override
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        IsarTaskEntrySchema,
      ],
      directory: dir.path,
    );
    _tasksRepository = IsarTaskEntrysRepository(
      isar: _isar,
    );
  }

  @override
  CrudRepository<TaskEntry> tasksRepository() => _tasksRepository;
}
