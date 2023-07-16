import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/task_deck_card.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class TaskDeck extends StatelessWidget {
  final List<TaskEntry> tasks;
  const TaskDeck({
    required this.tasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          for (final (i, task) in tasks.take(3).indexed.toList().reversed)
            Align(
              alignment: Alignment(0, i * 0.05),
              child: Transform.rotate(
                angle: pow(-1, i) * pi / 180 * 3 * i,
                child: SizedBox(
                  width: constraints.maxWidth / 2,
                  height: constraints.maxHeight / 6,
                  child: Opacity(
                    opacity: 1 - i * 0.2,
                    child: TaskDeckCard(task: task),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
