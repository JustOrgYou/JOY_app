import 'package:flutter/material.dart';

class TaskEditDeleteButton extends StatelessWidget {
  final VoidCallback? onDelete;
  const TaskEditDeleteButton({
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onDelete?.call(),
      icon: const Icon(Icons.delete),
      label: const Text('Удалить'),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.error,
        // TODO(me): after theme refactoring remove hardcoded color.
        disabledForegroundColor: Colors.grey,
      ),
    );
  }
}
