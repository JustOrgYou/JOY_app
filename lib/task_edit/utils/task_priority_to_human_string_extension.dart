import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

extension TaskPriorityToHumanStringExtension on TaskPriority {
  String humanString(BuildContext context) {
    switch (this) {
      case TaskPriority.low:
        return S.of(context).low_priority;
      case TaskPriority.medium:
        return S.of(context).medium_priority;
      case TaskPriority.high:
        return S.of(context).high_priority;
      case TaskPriority.none:
        return S.of(context).no;
    }
  }
}
