import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/task_deck_card.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class SuggestionCard extends StatelessWidget {
  final List<TaskEntry> tasks;

  const SuggestionCard({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskDeckCard(task: tasks[index]),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          ),

    );
  }
}
