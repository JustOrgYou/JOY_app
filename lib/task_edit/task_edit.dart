import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/shared/presentation/app_dropdown_button.dart';
import 'package:todo_app/task_edit/presentation/task_edit_delete_button.dart';
import 'package:todo_app/task_edit/presentation/task_edit_due_date_widget.dart';
import 'package:todo_app/task_edit/presentation/task_edit_separator_widget.dart';
import 'package:todo_app/task_edit/presentation/task_edit_title_editor.dart';
import 'package:todo_app/task_edit/utils/task_priority_to_color_extension.dart';
import 'package:todo_app/task_edit/utils/task_priority_to_human_string_extension.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class TaskEdit extends HookConsumerWidget {
  const TaskEdit({
    required this.taskEntry,
    this.onDelete,
    this.onEditComplete,
    super.key,
  });

  final TaskEntry taskEntry;
  final void Function(TaskEntry deletedEntry)? onDelete;
  final void Function(TaskEntry updatedEntry)? onEditComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryTitleEdit = useTextEditingController(text: taskEntry.title);
    final choosedPriority = useState(taskEntry.priority);
    final choosedCategory = useState(taskEntry.category);
    final dueDate = useState(taskEntry.dueDate);
    final categories = ref.watch(taskCategoriesProvider);

    void onSaveTask() {
      final newEntry = taskEntry.copyWith(
        title: entryTitleEdit.text,
        priority: choosedPriority.value,
        dueDate: dueDate.value,
        category: choosedCategory.value,
      );
      onEditComplete?.call(newEntry);
    }

    return Scaffold(
      /// app bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            // TODO(me): after theme refactoring remove hardcoded color.
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onSaveTask,
            child: const Text('СОХРАНИТЬ'),
          ),
        ],
      ),

      /// conten
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            /// edit field
            TaskEditTitleEditor(
              textEditingController: entryTitleEdit,
            ),

            /// choose priority
            AppDropownButton<TaskPriority>(
              choosedValue: choosedPriority,
              itemToString: (priority) => priority.humanString(),
              items: TaskPriority.values,
              title: 'Важность',
              itemToColor: (priority) => priority.color(context),
            ),
            const TaskEditSeparatorWidget(),

            /// choose category
            AppDropownButton<String?>(
              choosedValue: choosedCategory,
              itemToString: (category) => category ?? 'Без категории',
              items: categories,
              title: 'Category',
              itemToColor: (_) => Colors.black,
            ),
            const TaskEditSeparatorWidget(),

            /// due date switcher
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70),
              child: TaskEditDueDateWidget(
                dueDate: dueDate,
              ),
            ),
            const TaskEditSeparatorWidget(),

            /// delete button
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TaskEditDeleteButton(
                  onDelete:
                      onDelete == null ? null : () => onDelete?.call(taskEntry),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
