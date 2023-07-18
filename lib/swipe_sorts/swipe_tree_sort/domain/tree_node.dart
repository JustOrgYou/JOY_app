import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';

@unfreezed
class TreeNode<T> with _$TreeNode<T> {
  const TreeNode._();

  factory TreeNode.branch({
    required int capacity,
    required Map<int, TreeNode<T>> children,
    T? value,
    TreeBranch<T>? parent,
  }) = TreeBranch<T>;

  factory TreeNode.leaf({
    required T value,
    TreeBranch<T>? parent,
  }) = TreeLeaf<T>;
}

extension TreeNodeFlatten<T> on TreeNode<T> {
  Iterable<TreeNode<T>> flatten() {
    return map(
      leaf: (leaf) => [leaf],
      branch: (branch) => [
        branch,
        ...branch.children.values.expand((element) => element.flatten()),
      ],
    );
  }
}
