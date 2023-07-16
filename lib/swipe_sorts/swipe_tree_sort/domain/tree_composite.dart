import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_composite.freezed.dart';

@freezed
class TreeComposite<T> with _$TreeComposite<T> {
  Iterable<T> get flat => when(
        leaf: (value) => [value],
        branch: (children) => children.expand((element) => element.flat),
        empty: () => const Iterable.empty(),
        back: () => const Iterable.empty(),
      );

  const TreeComposite._();

  /// represents leaf with value could not have children
  const factory TreeComposite.leaf(T value) = TreeLeaf<T>;

  /// represents branch with children does not hold any value
  const factory TreeComposite.branch(List<TreeComposite<T>> children) =
      TreeBranch<T>;

  /// Special type to distinguish between parent (go back) and empty
  const factory TreeComposite.back() = TreeBack<T>;

  /// Special type to indicate user prefared empty places
  const factory TreeComposite.empty() = TreeEmpty<T>;
}
