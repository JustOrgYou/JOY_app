import 'package:flutter/material.dart';

class TaskDeck extends StatelessWidget {
  const TaskDeck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: const Column(
          children: [
            Text('TaskDeck'),
          ],
        ),
      ),
    );
  }
}
