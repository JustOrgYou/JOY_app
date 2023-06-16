import 'package:flutter/material.dart';

class TaskEditSeparatorWidget extends StatelessWidget {
  const TaskEditSeparatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
    );
  }
}
