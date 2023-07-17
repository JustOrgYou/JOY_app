import 'package:flutter/material.dart';
import 'package:todo_app/ml_suggestions_screen/ml_suggestions_screen_route.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/swipe_tree_sort_route.dart';
import 'package:todo_app/tasks_overview/tasks_overview.dart';
import 'package:todo_app/ml_suggestions_screen/ml_suggestions_screen.dart';


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
              SwipeTreeSortRoute(),
            ),
            child: const Text('Swipe Tree Sort'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MlSwipeTreeRoute(),
            ),
            child: const Text('ML screen'),
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
