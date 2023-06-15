import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entry.freezed.dart';

@freezed
class TaskEntry with _$TaskEntry {
  const TaskEntry._();

  const factory TaskEntry({
    required int id,
    required String title,
    required TaskPriority priority,
    required TaskStatus status,
    required DateTime? dueDate,
  }) = _TaskEntry;
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
