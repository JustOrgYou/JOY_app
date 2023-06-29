import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

part 'network_merger_task_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class NetworkMergerTaskDto {
  final String id;
  final String text;
  final String importance;
  final int? deadline;
  final bool done;
  final String? color;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'changed_at')
  final int changedAt;
  @JsonKey(name: 'last_updated_by')
  final String lastUpdatedBy;

  NetworkMergerTaskDto({
    required this.id,
    required this.text,
    required this.importance,
    required this.deadline,
    required this.done,
    required this.color,
    required this.createdAt,
    required this.changedAt,
    required this.lastUpdatedBy,
  });

  NetworkMergerTaskDto.fromTaskEntry(
    TaskEntry taskEntry,
  )   : id = taskEntry.id.toString(),
        text = taskEntry.title,
        importance = _convertTaskPriority(taskEntry.priority),
        deadline = taskEntry.dueDate == null
            ? null
            : taskEntry.dueDate!.millisecondsSinceEpoch ~/ 1000,
        done = taskEntry.status == TaskStatus.done,
        color = null,
        createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000,
        changedAt = DateTime.now().millisecondsSinceEpoch ~/ 1000,
        lastUpdatedBy = 'me';

  factory NetworkMergerTaskDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkMergerTaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMergerTaskDtoToJson(this);

  TaskEntry toTaskEntry() {
    final TaskPriority priority;
    switch (importance) {
      case 'low':
        priority = TaskPriority.low;
        break;
      case 'basic':
        priority = TaskPriority.medium;
        break;
      case 'important':
        priority = TaskPriority.high;
        break;
      default:
        priority = TaskPriority.none;
    }

    final status = done ? TaskStatus.done : TaskStatus.open;
    final dueDate = deadline == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(deadline! * 1000);

    return TaskEntry(
      id: int.parse(id),
      dueDate: dueDate,
      priority: priority,
      status: status,
      title: text,
    );
  }
}

String _convertTaskPriority(TaskPriority priority) {
  switch (priority) {
    case TaskPriority.low:
      return 'low';
    case TaskPriority.medium:
      return 'basic';
    case TaskPriority.high:
      return 'important';
    case TaskPriority.none:
      return 'basic';
  }
}
