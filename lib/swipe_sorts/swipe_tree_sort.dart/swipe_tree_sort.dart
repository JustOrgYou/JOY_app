// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  return Tuple2(categories, tasks);
}

class SwipeTreeSort extends HookConsumerWidget {
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
                  SizedBox(height: 20),
                  Text(stackTrace.toString()),
                ],
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) => SwipeTreeBranch(
            branch: data.item1,
            tasks: data.item2,
          ),
        ),
      ),
    );
  }
}
