import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class TaskDeckCard extends StatelessWidget {
  final TaskEntry? task;
  final Color? textColor;
  final Color? backgroundColor;

  const TaskDeckCard({
    required this.task,
    this.textColor,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      /// TODO: use colorscheme.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        color: backgroundColor ?? Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              task?.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            AutoSizeText(
              task?.description ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
