import 'package:flutter/material.dart';
import 'package:todo_app/generated/l10n.dart';

class TaskEditDeleteButton extends StatelessWidget {
  const TaskEditDeleteButton({
    this.onDelete,
    super.key,
  });

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onDelete,
      icon: const Icon(Icons.delete),
      label: Text(S.of(context).delete),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.error,
        // TODO(me): after theme refactoring remove hardcoded color.
        disabledForegroundColor: Colors.grey,
      ),
    );
  }
}
