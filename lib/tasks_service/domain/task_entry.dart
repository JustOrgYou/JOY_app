import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entry.freezed.dart';

@freezed
class TaskEntry with _$TaskEntry {
  const factory TaskEntry({
    required String title,
    required TaskPriority priority,
    required TaskStatus status,
    required DateTime? dueDate,
    required DateTime createDate,
    required DateTime changedDate,
    @Assert('category != ""', 'If no category null should be placed')
    String? category,
    int? id,
  }) = _TaskEntry;

  const TaskEntry._();

  factory TaskEntry.empty() => _TaskEntry(
        title: '',
        priority: TaskPriority.none,
        status: TaskStatus.open,
        dueDate: null,
        changedDate: DateTime.now(),
        createDate: DateTime.now(),
      );
}

enum TaskPriority {
  none,
  low,
  medium,
  high,
}

enum TaskStatus {
  open,
  done,
}
