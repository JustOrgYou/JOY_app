import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/task_edit/task_edit.dart';
import 'package:todo_app/tasks_overview/data/task_providers.dart';
import 'package:todo_app/tasks_overview/domain/task_entry.dart';
import 'package:todo_app/tasks_overview/presentation/sliver_task_overview_bar.dart';
import 'package:todo_app/tasks_overview/presentation/task_overview_card.dart';

class TasksOverview extends ConsumerWidget {
  const TasksOverview({
    super.key,
  });

  void _onFabAddNewPressed() {
    print('fab add new');
  }

  void _onAddNewButtonPressed() {
    print('add new');
  }

  void _onToggleVisibilityPressed() {
    print('toggle visibility');
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabAddNewPressed,
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
                  areDoneTasksVisible: true,
                  toggleVisibilityCallback: _onToggleVisibilityPressed,
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
                                    onPressed: _onAddNewButtonPressed,
                                    child: const Text('Load more'),
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
