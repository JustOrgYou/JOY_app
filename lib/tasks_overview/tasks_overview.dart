import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/task_edit/task_edit.dart';
import 'package:todo_app/tasks_overview/data/task_providers.dart';
import 'package:todo_app/tasks_overview/domain/task_entry.dart';
import 'package:todo_app/tasks_overview/domain/task_service.dart';
import 'package:todo_app/tasks_overview/presentation/sliver_task_overview_bar.dart';
import 'package:todo_app/tasks_overview/presentation/task_overview_card.dart';

class TasksOverview extends ConsumerWidget {
  const TasksOverview({
    super.key,
  });

  Future<void> _createNewTaskInEditor(WidgetRef ref) async {
    final taskEntryService = ref.read(taskEntryServiceProvider);
    final newEntry = await taskEntryService.createTaskEntry();

    /// As far as I understand, context is used synchronously, so it fake alerts.
    if (!ref.context.mounted) return;
    // ignore: use_build_context_synchronously
    Navigator.push(
      ref.context,
      MaterialPageRoute(
        builder: (context) => TaskEdit(
          taskEntry: newEntry,
          onEditComplete: (updatedEntry) async {
            await taskEntryService.updateTaskEntry(
              updatedEntry,
            );
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            Navigator.pop(ref.context);
          },
        ),
      ),
    );
  }

  void _onFabAddNewPressed(WidgetRef ref) {
    _createNewTaskInEditor(ref);
  }

  void _onAddNewButtonPressed(WidgetRef ref) {
    _createNewTaskInEditor(ref);
  }

  void _onToggleVisibilityPressed(WidgetRef ref) {
    final doneTasksNotifier = ref.read(doneTasksVisibilityProvider.notifier);
    doneTasksNotifier.state = !doneTasksNotifier.state;
  }

  void _onTaskCardPressed(BuildContext context, TaskEntry taskEntry) {
    if (!context.mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskEdit(
          taskEntry: taskEntry,
        ),
      ),
    );
  }

  void _onTaskCardDeletePressed(TaskEntry taskEntry) {
    print('delete');
    print(taskEntry);
  }

  void _onTaskCardDonePressed(TaskEntry taskEntry) {
    print('done');
    print(taskEntry);
  }

  void _onTaskCardInfoPressed(TaskEntry taskEntry) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskEntriesSnapshot = ref.watch(taskEntryStreamProvider);
    final areDoneTasksVisible = ref.watch(doneTasksVisibilityProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabAddNewPressed(ref),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: taskEntriesSnapshot.when(
        /// error display
        error: (Object error, StackTrace stackTrace) => Center(
          child: Text('Error: $error'),
        ),

        /// loading state display
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        /// ready tasks display
        data: (List<TaskEntry> taskEntries) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.background,
            ),
            child: CustomScrollView(
              slivers: [
                /// appbar
                SliverTaskOverviewBar(
                  doneTasksCount: 3,
                  areDoneTasksVisible: areDoneTasksVisible,
                  toggleVisibilityCallback: () =>
                      _onToggleVisibilityPressed(ref),
                ),

                /// task cards and "add new" button
                SliverToBoxAdapter(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:

                            /// Task Cards
                            taskEntries
                                .where(
                                  (task) =>
                                      // TODO(me): google does dart lazy evaluate boolean expressions?
                                      // if it is so, then this speedup when all tasks are visible
                                      areDoneTasksVisible ||
                                      task.status != TaskStatus.done,
                                )
                                .map<Widget>(
                                  (task) => TaskOverviewCard(
                                    taskEntry: task,
                                    onDelete: _onTaskCardDeletePressed,
                                    onDone: _onTaskCardDonePressed,
                                    onPressed: (entry) => _onTaskCardPressed(
                                      context,
                                      entry,
                                    ),
                                    onInfoPressed: _onTaskCardInfoPressed,
                                  ),
                                )
                                .toList()

                              /// add "New Button"
                              ..add(
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () =>
                                        _onAddNewButtonPressed(ref),
                                    child: const Text('Новое'),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
