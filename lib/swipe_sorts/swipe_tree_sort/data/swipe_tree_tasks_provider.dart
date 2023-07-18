import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/domain/tree_node.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';

part 'swipe_tree_tasks_provider.g.dart';

@riverpod
Future<TreeBranch<String>> swipeTreeTasks(Ref ref) async {
  final categories = ref.watch(taskCategoriesProvider);

  const childrenLimit = 3;
  final rawTree = constructTree<String>(
    data: categories,
    childrenLimit: childrenLimit,
    hasBack: true,
  );
  final tree = setParentsTree(rawTree);

  final treeItems =
      tree.flatten().whereType<TreeLeaf<String>>().map((e) => e.value).toList();

  assert(treeItems.length == categories.length);
  assert(categories.toSet().difference(treeItems.toSet()).isEmpty);

  return tree;
}

TreeBranch<T> constructTree<T>({
  required List<T> data,
  required int childrenLimit,
  required bool hasBack,
}) {
  final nodes = data.map((e) => TreeNode<T>.leaf(value: e)).toList();
  while (nodes.length > 1) {
    final int tookNodes = min(childrenLimit, nodes.length);

    final newNode = TreeNode<T>.branch(
      capacity: childrenLimit + (hasBack ? 1 : 0),
      children: Map.from(nodes.take(childrenLimit).toList().asMap()),
    ) as TreeBranch<T>;

    /// set parents
    for (final element in newNode.children.values) {
      element.parent = newNode;
    }

    nodes
      ..removeRange(0, tookNodes)
      ..add(newNode);
  }
  final root = nodes.first;
  return root as TreeBranch<T>;
}

TreeBranch<T> setParentsTree<T>(TreeBranch<T> root) {
  for (final element in root.children.values) {
    element.parent = root;
    if (element is TreeBranch<T>) {
      setParentsTree(element);
      //   final back = element.goBackIndex();
      //   if (back != null && element.children[back] != null) {
      //     for (var i = back; i < element.capacity; i++) {
      //       final candidate = element.children[i + 1];
      //       if (candidate != null) {
      //         continue;
      //       }
      //       element.children[i] = element.children[back]!;
      //       break;
      //     }
      //     element.children.remove(back);
      //   }
    }
  }
  return root;
}
