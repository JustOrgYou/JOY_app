import 'package:flutter/material.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/swipe_tree_sort.dart';
import 'package:todo_app/tasks_overview/tasks_overview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const SwipeTreeSort(),
              ),
            ),
            child: const Text('Swipe Tree Sort'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const TasksOverview(),
              ),
            ),
            child: const Text('Tasks Overview'),
          ),
        ],
      ),
    );
  }
}
