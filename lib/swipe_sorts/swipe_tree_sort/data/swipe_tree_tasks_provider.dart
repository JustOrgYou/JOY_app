import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/domain/tree_composite.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';

part 'swipe_tree_tasks_provider.g.dart';

@riverpod
Future<TreeBranch<String>> swipeTreeTasks(Ref ref) async {
  final categories = ref.watch(taskCategoriesProvider);

  /// TODO: read tree settings somewhere and use them to construct swipe tree

  final maxIndex = categories.length;
  if (maxIndex == 0) {
    return const TreeComposite.branch([]) as TreeBranch<String>;
  }
  // final maxDepth = (log(maxIndex) / log(4)).ceil();

  /// Composite do not care about leaf and branch, but for root node it us crucial
  return constructTree<String>(categories, 4);
}

/// TODO: move this somewhere else.

List<T> _fullFill<T>(List<T> list, int length, T Function() filler) {
  final result = list.toList();
  for (var i = 0; i < length - list.length; i++) {
    result.add(filler());
  }
  return result;
}

TreeBranch<T> constructTree<T>(List<T> items, int maxChildrenPerNode) {
  final nodes = items.map(TreeComposite.leaf).toList();

  /// bottom up approach
  while (nodes.length > 1) {
    final children = nodes.take(maxChildrenPerNode - 1).toList()
      ..add(const TreeComposite.back());

    /// make back node correspond to index
    for (var i = 0; i < children.length; i++) {
      final child = children[i];

      children[i] = child.maybeMap(
        branch: (treeBranch) {
          final backIndex = (maxChildrenPerNode / 2 + i)
              .round()
              .remainder(maxChildrenPerNode);
          final fullfilled = _fullFill<TreeComposite<T>>(
            treeBranch.children,
            maxChildrenPerNode,
            TreeComposite.empty,
          );
          final replacedBack = fullfilled.where((e) => e is! TreeBack).toList()
            ..insert(
              backIndex,
              const TreeComposite.back(),
            );

          return treeBranch.copyWith(children: replacedBack);
        },
        orElse: () => child,
      );
    }

    final newBranch = TreeComposite.branch(children);
    nodes
      ..removeRange(0, min(maxChildrenPerNode - 1, nodes.length))
      ..add(newBranch);
  }
  final node = nodes[0];
  return node.maybeMap(
    branch: (node) => node.copyWith(
      children: _fullFill<TreeComposite<T>>(
        node.children.where((e) => e is! TreeBack).toList(),
        maxChildrenPerNode,
        TreeComposite.empty,
      ),
    ),
    orElse: () => throw Exception('Unexpected error'),
  );
}
