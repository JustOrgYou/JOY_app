import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/tasks_service/data/task_service_mock.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

final taskEntryServiceProvider = Provider<TaskEntryService>(
  (ref) => TaskEntryServiceMock(),
);

final taskEntryStreamProvider = StreamProvider.autoDispose<List<TaskEntry>>(
  (ref) => ref.watch(taskEntryServiceProvider).getTaskEntriesStream(),
);
final doneTasksVisibilityProvider = StateProvider<bool>((ref) => true);
