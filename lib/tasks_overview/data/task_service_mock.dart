import 'package:todo_app/tasks_overview/domain/task_entry.dart';
import 'package:todo_app/tasks_overview/domain/task_service.dart';

class TaskEntryServiceMock implements TaskEntryService {
  Future<List<TaskEntry>> getTaskEntries() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return List<TaskEntry>.generate(
      100,
      (index) => TaskEntry(
        id: index,
        title: 'Task $index',
        priority: TaskPriority.values[index % TaskPriority.values.length],
        status: TaskStatus.values[index % TaskStatus.values.length],
        dueDate: DateTime.now().add(Duration(days: index)),
      ),
    );
  }

  Future<void> addTaskEntry(TaskEntry taskEntry) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }

  Future<void> updateTaskEntry(TaskEntry taskEntry) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> createTaskEntry(TaskEntry taskEntry) async {
    // mock does not has state
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deleteTaskEntry(int id) async {
    // mock does not has state
    await Future.delayed(const Duration(seconds: 1));
  }
}
