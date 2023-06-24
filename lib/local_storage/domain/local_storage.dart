import 'package:todo_app/local_storage/domain/crud_repository.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

abstract class LocalStorage {
  /// call initialize() before using any other methods.
  /// In general is recommended to do it once and before app run.
  /// Concrete implementations may be tolerant to violation, but
  /// responsibility is fully on developer and may entail unexpected behavior.
  Future<void> initialize();
  CrudRepository<TaskEntry> tasksRepository();
}
