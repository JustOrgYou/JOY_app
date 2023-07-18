import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

part 'ml_task_entry_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class MlTaskEntryDto {
  final int pk;
  final String title;
  final String body;
  // final List<void> children = List.empty();
  // final int priority;
  // final String keyword;
  // final List<String> tags;
  // final String? scheduled;
  // final String? deadline;

  MlTaskEntryDto({
    required this.pk,
    required this.title,
    required this.body,
    // required this.priority,
    // required this.keyword,
    // required this.tags,
    // this.scheduled,
    // this.deadline,
  });

  MlTaskEntryDto.fromTaskEntry(TaskEntry taskEntry)
      : pk = taskEntry.id ?? 0,
        title = taskEntry.title,
        body = taskEntry.description ?? '';
        // priority = taskEntry.priority.index,
        // keyword = taskEntry.category ?? 'INBOX',
        // deadline = null,
        // scheduled = null;
  // tags = [];

  // deadline = taskEntry.dueDate?.toIso8601String() ??
  // DateTime.now().toIso8601String(),

  factory MlTaskEntryDto.fromJson(Map<String, dynamic> json) =>
      _$MlTaskEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MlTaskEntryDtoToJson(this);
}
