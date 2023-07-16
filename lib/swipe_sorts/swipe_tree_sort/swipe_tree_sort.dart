import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/data/swipe_tree_tasks_provider.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/domain/tree_composite.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort.dart/presentation/swipe_tree_branch.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:tuple/tuple.dart';

part 'swipe_tree_sort.g.dart';

/// don't think that this is ideal solution, probaly splitted providers will be better in case if
/// we want to promt user to setup swipe tree. But now to reduce boilerplate approach is used
@riverpod
Future<Tuple2<TreeBranch<String>, List<TaskEntry>>> swipeSearchDetail(
  Ref ref,
) async {
  final categories = await ref.read(swipeTreeTasksProvider.future);
  final tasks = await ref.watch(taskEntryStreamProvider.future);
  // final emptyTask = TaskEntry.empty();
//   final tasks = [
//     emptyTask.copyWith(
//       title: 'task 1 title blah blah blah',
//       description: 'some short desription',
//     ),
//     emptyTask.copyWith(
//       title: 'task 2 title olla olla olla',
//       description: 'regular description with\nmultiple lines\nand line breaks',
//     ),
//     emptyTask.copyWith(
//       title: 'task 3 very long title blah blah blah olla olla olla',
//       description: '''
// lorem ipsum dolor sit amet, consectetur adipiscing elit,
// sed do eiusmod tempor incididunt ut labore et
// dolore magna aliqua. Ut enim ad minim veniam quis
// nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
// Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
//     ),
//   ];

  return Tuple2(categories, tasks);
}

class SwipeTreeSort extends ConsumerWidget {
  const SwipeTreeSort({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swipeSearchDetails = ref.watch(swipeSearchDetailProvider);
    return SafeArea(
      child: Scaffold(
        body: swipeSearchDetails.when(
          error: (error, stackTrace) {
            return Center(
              child: ListView(
                children: [
                  Text('Error: $error'),
                  const SizedBox(height: 20),
                  Text(stackTrace.toString()),
                ],
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) {
            if (data.item2.isEmpty) {
              return const Center(
                child: Text('No tasks :)'),
              );
            }
            return SwipeTreeBranch(
              branch: data.item1,
              tasks: data.item2,
              onActionChoosed: (taskEntry, category) async {
                await ref
                    .read(taskEntryServiceProvider)
                    .changeCategory(taskEntry, category);
              },
            );
          },
        ),
      ),
    );
  }
}
