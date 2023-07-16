// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_composite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TreeComposite<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) leaf,
    required TResult Function(List<TreeComposite<T>> children) branch,
    required TResult Function() back,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? leaf,
    TResult? Function(List<TreeComposite<T>> children)? branch,
    TResult? Function()? back,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? leaf,
    TResult Function(List<TreeComposite<T>> children)? branch,
    TResult Function()? back,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeLeaf<T> value) leaf,
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeBack<T> value) back,
    required TResult Function(TreeEmpty<T> value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeLeaf<T> value)? leaf,
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeBack<T> value)? back,
    TResult? Function(TreeEmpty<T> value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeLeaf<T> value)? leaf,
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeBack<T> value)? back,
    TResult Function(TreeEmpty<T> value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeCompositeCopyWith<T, $Res> {
  factory $TreeCompositeCopyWith(
          TreeComposite<T> value, $Res Function(TreeComposite<T>) then) =
      _$TreeCompositeCopyWithImpl<T, $Res, TreeComposite<T>>;
}

/// @nodoc
class _$TreeCompositeCopyWithImpl<T, $Res, $Val extends TreeComposite<T>>
    implements $TreeCompositeCopyWith<T, $Res> {
  _$TreeCompositeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TreeLeafCopyWith<T, $Res> {
  factory _$$TreeLeafCopyWith(
          _$TreeLeaf<T> value, $Res Function(_$TreeLeaf<T>) then) =
      __$$TreeLeafCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$TreeLeafCopyWithImpl<T, $Res>
    extends _$TreeCompositeCopyWithImpl<T, $Res, _$TreeLeaf<T>>
    implements _$$TreeLeafCopyWith<T, $Res> {
  __$$TreeLeafCopyWithImpl(
      _$TreeLeaf<T> _value, $Res Function(_$TreeLeaf<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$TreeLeaf<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$TreeLeaf<T> extends TreeLeaf<T> {
  const _$TreeLeaf(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'TreeComposite<$T>.leaf(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeLeaf<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeLeafCopyWith<T, _$TreeLeaf<T>> get copyWith =>
      __$$TreeLeafCopyWithImpl<T, _$TreeLeaf<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) leaf,
    required TResult Function(List<TreeComposite<T>> children) branch,
    required TResult Function() back,
    required TResult Function() empty,
  }) {
    return leaf(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? leaf,
    TResult? Function(List<TreeComposite<T>> children)? branch,
    TResult? Function()? back,
    TResult? Function()? empty,
  }) {
    return leaf?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? leaf,
    TResult Function(List<TreeComposite<T>> children)? branch,
    TResult Function()? back,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (leaf != null) {
      return leaf(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeLeaf<T> value) leaf,
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeBack<T> value) back,
    required TResult Function(TreeEmpty<T> value) empty,
  }) {
    return leaf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeLeaf<T> value)? leaf,
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeBack<T> value)? back,
    TResult? Function(TreeEmpty<T> value)? empty,
  }) {
    return leaf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeLeaf<T> value)? leaf,
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeBack<T> value)? back,
    TResult Function(TreeEmpty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (leaf != null) {
      return leaf(this);
    }
    return orElse();
  }
}

abstract class TreeLeaf<T> extends TreeComposite<T> {
  const factory TreeLeaf(final T value) = _$TreeLeaf<T>;
  const TreeLeaf._() : super._();

  T get value;
  @JsonKey(ignore: true)
  _$$TreeLeafCopyWith<T, _$TreeLeaf<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeBranchCopyWith<T, $Res> {
  factory _$$TreeBranchCopyWith(
          _$TreeBranch<T> value, $Res Function(_$TreeBranch<T>) then) =
      __$$TreeBranchCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<TreeComposite<T>> children});
}

/// @nodoc
class __$$TreeBranchCopyWithImpl<T, $Res>
    extends _$TreeCompositeCopyWithImpl<T, $Res, _$TreeBranch<T>>
    implements _$$TreeBranchCopyWith<T, $Res> {
  __$$TreeBranchCopyWithImpl(
      _$TreeBranch<T> _value, $Res Function(_$TreeBranch<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$TreeBranch<T>(
      null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeComposite<T>>,
    ));
  }
}

/// @nodoc

class _$TreeBranch<T> extends TreeBranch<T> {
  const _$TreeBranch(final List<TreeComposite<T>> children)
      : _children = children,
        super._();

  final List<TreeComposite<T>> _children;
  @override
  List<TreeComposite<T>> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'TreeComposite<$T>.branch(children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeBranch<T> &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeBranchCopyWith<T, _$TreeBranch<T>> get copyWith =>
      __$$TreeBranchCopyWithImpl<T, _$TreeBranch<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) leaf,
    required TResult Function(List<TreeComposite<T>> children) branch,
    required TResult Function() back,
    required TResult Function() empty,
  }) {
    return branch(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? leaf,
    TResult? Function(List<TreeComposite<T>> children)? branch,
    TResult? Function()? back,
    TResult? Function()? empty,
  }) {
    return branch?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? leaf,
    TResult Function(List<TreeComposite<T>> children)? branch,
    TResult Function()? back,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (branch != null) {
      return branch(children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeLeaf<T> value) leaf,
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeBack<T> value) back,
    required TResult Function(TreeEmpty<T> value) empty,
  }) {
    return branch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeLeaf<T> value)? leaf,
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeBack<T> value)? back,
    TResult? Function(TreeEmpty<T> value)? empty,
  }) {
    return branch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeLeaf<T> value)? leaf,
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeBack<T> value)? back,
    TResult Function(TreeEmpty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (branch != null) {
      return branch(this);
    }
    return orElse();
  }
}

abstract class TreeBranch<T> extends TreeComposite<T> {
  const factory TreeBranch(final List<TreeComposite<T>> children) =
      _$TreeBranch<T>;
  const TreeBranch._() : super._();

  List<TreeComposite<T>> get children;
  @JsonKey(ignore: true)
  _$$TreeBranchCopyWith<T, _$TreeBranch<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeBackCopyWith<T, $Res> {
  factory _$$TreeBackCopyWith(
          _$TreeBack<T> value, $Res Function(_$TreeBack<T>) then) =
      __$$TreeBackCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TreeBackCopyWithImpl<T, $Res>
    extends _$TreeCompositeCopyWithImpl<T, $Res, _$TreeBack<T>>
    implements _$$TreeBackCopyWith<T, $Res> {
  __$$TreeBackCopyWithImpl(
      _$TreeBack<T> _value, $Res Function(_$TreeBack<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TreeBack<T> extends TreeBack<T> {
  const _$TreeBack() : super._();

  @override
  String toString() {
    return 'TreeComposite<$T>.back()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TreeBack<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) leaf,
    required TResult Function(List<TreeComposite<T>> children) branch,
    required TResult Function() back,
    required TResult Function() empty,
  }) {
    return back();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? leaf,
    TResult? Function(List<TreeComposite<T>> children)? branch,
    TResult? Function()? back,
    TResult? Function()? empty,
  }) {
    return back?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? leaf,
    TResult Function(List<TreeComposite<T>> children)? branch,
    TResult Function()? back,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (back != null) {
      return back();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeLeaf<T> value) leaf,
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeBack<T> value) back,
    required TResult Function(TreeEmpty<T> value) empty,
  }) {
    return back(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeLeaf<T> value)? leaf,
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeBack<T> value)? back,
    TResult? Function(TreeEmpty<T> value)? empty,
  }) {
    return back?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeLeaf<T> value)? leaf,
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeBack<T> value)? back,
    TResult Function(TreeEmpty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (back != null) {
      return back(this);
    }
    return orElse();
  }
}

abstract class TreeBack<T> extends TreeComposite<T> {
  const factory TreeBack() = _$TreeBack<T>;
  const TreeBack._() : super._();
}

/// @nodoc
abstract class _$$TreeEmptyCopyWith<T, $Res> {
  factory _$$TreeEmptyCopyWith(
          _$TreeEmpty<T> value, $Res Function(_$TreeEmpty<T>) then) =
      __$$TreeEmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TreeEmptyCopyWithImpl<T, $Res>
    extends _$TreeCompositeCopyWithImpl<T, $Res, _$TreeEmpty<T>>
    implements _$$TreeEmptyCopyWith<T, $Res> {
  __$$TreeEmptyCopyWithImpl(
      _$TreeEmpty<T> _value, $Res Function(_$TreeEmpty<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TreeEmpty<T> extends TreeEmpty<T> {
  const _$TreeEmpty() : super._();

  @override
  String toString() {
    return 'TreeComposite<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TreeEmpty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) leaf,
    required TResult Function(List<TreeComposite<T>> children) branch,
    required TResult Function() back,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? leaf,
    TResult? Function(List<TreeComposite<T>> children)? branch,
    TResult? Function()? back,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? leaf,
    TResult Function(List<TreeComposite<T>> children)? branch,
    TResult Function()? back,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeLeaf<T> value) leaf,
    required TResult Function(TreeBranch<T> value) branch,
    required TResult Function(TreeBack<T> value) back,
    required TResult Function(TreeEmpty<T> value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeLeaf<T> value)? leaf,
    TResult? Function(TreeBranch<T> value)? branch,
    TResult? Function(TreeBack<T> value)? back,
    TResult? Function(TreeEmpty<T> value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeLeaf<T> value)? leaf,
    TResult Function(TreeBranch<T> value)? branch,
    TResult Function(TreeBack<T> value)? back,
    TResult Function(TreeEmpty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class TreeEmpty<T> extends TreeComposite<T> {
  const factory TreeEmpty() = _$TreeEmpty<T>;
  const TreeEmpty._() : super._();
}
