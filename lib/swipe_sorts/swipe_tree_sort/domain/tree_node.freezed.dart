// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TreeNode<T> {
  T? get value => throw _privateConstructorUsedError;
  TreeBranch<T>? get parent => throw _privateConstructorUsedError;
  set parent(TreeBranch<T>? value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int capacity, Map<int, TreeNode<T>> children,
            T? value, TreeBranch<T>? parent)
        branch,
    required TResult Function(T value, TreeBranch<T>? parent) leaf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult? Function(T value, TreeBranch<T>? parent)? leaf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult Function(T value, TreeBranch<T>? parent)? leaf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeLeaf<T> value) leaf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeLeaf<T> value)? leaf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeLeaf<T> value)? leaf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TreeNodeCopyWith<T, TreeNode<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeCopyWith<T, $Res> {
  factory $TreeNodeCopyWith(
          TreeNode<T> value, $Res Function(TreeNode<T>) then) =
      _$TreeNodeCopyWithImpl<T, $Res, TreeNode<T>>;
  @useResult
  $Res call({TreeBranch<T>? parent});
}

/// @nodoc
class _$TreeNodeCopyWithImpl<T, $Res, $Val extends TreeNode<T>>
    implements $TreeNodeCopyWith<T, $Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = freezed,
  }) {
    return _then(_value.copyWith(
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeBranch<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeBranchCopyWith<T, $Res>
    implements $TreeNodeCopyWith<T, $Res> {
  factory _$$TreeBranchCopyWith(
          _$TreeBranch<T> value, $Res Function(_$TreeBranch<T>) then) =
      __$$TreeBranchCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int capacity,
      Map<int, TreeNode<T>> children,
      T? value,
      TreeBranch<T>? parent});
}

/// @nodoc
class __$$TreeBranchCopyWithImpl<T, $Res>
    extends _$TreeNodeCopyWithImpl<T, $Res, _$TreeBranch<T>>
    implements _$$TreeBranchCopyWith<T, $Res> {
  __$$TreeBranchCopyWithImpl(
      _$TreeBranch<T> _value, $Res Function(_$TreeBranch<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capacity = null,
    Object? children = null,
    Object? value = freezed,
    Object? parent = freezed,
  }) {
    return _then(_$TreeBranch<T>(
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Map<int, TreeNode<T>>,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeBranch<T>?,
    ));
  }
}

/// @nodoc

class _$TreeBranch<T> extends TreeBranch<T> with DiagnosticableTreeMixin {
  _$TreeBranch(
      {required this.capacity, required this.children, this.value, this.parent})
      : super._();

  @override
  int capacity;
  @override
  Map<int, TreeNode<T>> children;
  @override
  T? value;
  @override
  TreeBranch<T>? parent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreeNode<$T>.branch(capacity: $capacity, children: $children, value: $value, parent: $parent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TreeNode<$T>.branch'))
      ..add(DiagnosticsProperty('capacity', capacity))
      ..add(DiagnosticsProperty('children', children))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('parent', parent));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeBranchCopyWith<T, _$TreeBranch<T>> get copyWith =>
      __$$TreeBranchCopyWithImpl<T, _$TreeBranch<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int capacity, Map<int, TreeNode<T>> children,
            T? value, TreeBranch<T>? parent)
        branch,
    required TResult Function(T value, TreeBranch<T>? parent) leaf,
  }) {
    return branch(capacity, children, value, parent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult? Function(T value, TreeBranch<T>? parent)? leaf,
  }) {
    return branch?.call(capacity, children, value, parent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult Function(T value, TreeBranch<T>? parent)? leaf,
    required TResult orElse(),
  }) {
    if (branch != null) {
      return branch(capacity, children, value, parent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeLeaf<T> value) leaf,
  }) {
    return branch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeLeaf<T> value)? leaf,
  }) {
    return branch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeLeaf<T> value)? leaf,
    required TResult orElse(),
  }) {
    if (branch != null) {
      return branch(this);
    }
    return orElse();
  }
}

abstract class TreeBranch<T> extends TreeNode<T> {
  factory TreeBranch(
      {required int capacity,
      required Map<int, TreeNode<T>> children,
      T? value,
      TreeBranch<T>? parent}) = _$TreeBranch<T>;
  TreeBranch._() : super._();

  int get capacity;
  set capacity(int value);
  Map<int, TreeNode<T>> get children;
  set children(Map<int, TreeNode<T>> value);
  @override
  T? get value;
  set value(T? value);
  @override
  TreeBranch<T>? get parent;
  set parent(TreeBranch<T>? value);
  @override
  @JsonKey(ignore: true)
  _$$TreeBranchCopyWith<T, _$TreeBranch<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeLeafCopyWith<T, $Res>
    implements $TreeNodeCopyWith<T, $Res> {
  factory _$$TreeLeafCopyWith(
          _$TreeLeaf<T> value, $Res Function(_$TreeLeaf<T>) then) =
      __$$TreeLeafCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value, TreeBranch<T>? parent});
}

/// @nodoc
class __$$TreeLeafCopyWithImpl<T, $Res>
    extends _$TreeNodeCopyWithImpl<T, $Res, _$TreeLeaf<T>>
    implements _$$TreeLeafCopyWith<T, $Res> {
  __$$TreeLeafCopyWithImpl(
      _$TreeLeaf<T> _value, $Res Function(_$TreeLeaf<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? parent = freezed,
  }) {
    return _then(_$TreeLeaf<T>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeBranch<T>?,
    ));
  }
}

/// @nodoc

class _$TreeLeaf<T> extends TreeLeaf<T> with DiagnosticableTreeMixin {
  _$TreeLeaf({required this.value, this.parent}) : super._();

  @override
  T value;
  @override
  TreeBranch<T>? parent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TreeNode<$T>.leaf(value: $value, parent: $parent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TreeNode<$T>.leaf'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('parent', parent));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeLeafCopyWith<T, _$TreeLeaf<T>> get copyWith =>
      __$$TreeLeafCopyWithImpl<T, _$TreeLeaf<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int capacity, Map<int, TreeNode<T>> children,
            T? value, TreeBranch<T>? parent)
        branch,
    required TResult Function(T value, TreeBranch<T>? parent) leaf,
  }) {
    return leaf(value, parent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult? Function(T value, TreeBranch<T>? parent)? leaf,
  }) {
    return leaf?.call(value, parent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int capacity, Map<int, TreeNode<T>> children, T? value,
            TreeBranch<T>? parent)?
        branch,
    TResult Function(T value, TreeBranch<T>? parent)? leaf,
    required TResult orElse(),
  }) {
    if (leaf != null) {
      return leaf(value, parent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeLeaf<T> value) leaf,
  }) {
    return leaf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeLeaf<T> value)? leaf,
  }) {
    return leaf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeLeaf<T> value)? leaf,
    required TResult orElse(),
  }) {
    if (leaf != null) {
      return leaf(this);
    }
    return orElse();
  }
}

abstract class TreeLeaf<T> extends TreeNode<T> {
  factory TreeLeaf({required T value, TreeBranch<T>? parent}) = _$TreeLeaf<T>;
  TreeLeaf._() : super._();

  @override
  T get value;
  set value(T value);
  @override
  TreeBranch<T>? get parent;
  set parent(TreeBranch<T>? value);
  @override
  @JsonKey(ignore: true)
  _$$TreeLeafCopyWith<T, _$TreeLeaf<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
