import 'package:todo_app/tasks_overview/domain/task_entry.dart';

abstract class TaskEntryService {
  Future<List<TaskEntry>> getTaskEntries();
  Future<void> createTaskEntry(TaskEntry taskEntry);
  Future<void> updateTaskEntry(TaskEntry taskEntry);
  Future<void> deleteTaskEntry(int id);
}
