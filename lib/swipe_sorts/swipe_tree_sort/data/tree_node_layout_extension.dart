import 'package:todo_app/swipe_sorts/swipe_tree_sort/domain/tree_node.dart';
import 'package:todo_app/swipe_sorts/swipe_tree_sort/presentation/swipe_sort_swipe_direction_widget.dart';

extension TreeNodeLayoutExtension<T> on TreeNode<T> {
  /// this method make sense to use only if [capacity] is persistent across all tree.
  /// If capacity does not match  or no parent return null.
  int? goBackIndex() {
    if (parent == null) {
      return null;
    }
    if (maybeMap(branch: (branch) => branch.capacity, orElse: () => 0) !=
        parent!.capacity) {
      return null;
    }
    final indexInParent = parent!.children.entries
        .firstWhere((element) => element.value == this)
        .key;
    final parentCapacity = parent!.capacity;

    return (parentCapacity ~/ 2 + indexInParent) % parentCapacity;
  }

  TreeNode<T>? operator [](int index) {
    return maybeMap(
      branch: (branch) {
        assert(
          index < branch.capacity,
          'only indexes within range could be used  index: $index, capacity: ${branch.capacity}',
        );
        assert(index >= 0, 'index must be positive');

        final maybeBack = goBackIndex();
        if (index == maybeBack) {
          return null;
        } else if (maybeBack != null && index > maybeBack) {
          return branch.children[index - 1];
        }
        return branch.children[index];
      },
      orElse: () => null,
    );
  }

  SwipeDirectionWidgetType directionType(int index) {
    return this[index]?.map(
          branch: (branch) => SwipeDirectionWidgetType.branch,
          leaf: (leaf) => SwipeDirectionWidgetType.leaf,
        ) ??
        (this.goBackIndex() == index
            ? SwipeDirectionWidgetType.back
            : SwipeDirectionWidgetType.none);
  }
}

extension TreeNodeLayoutDirectionExtension<T> on TreeNode<T>? {}
