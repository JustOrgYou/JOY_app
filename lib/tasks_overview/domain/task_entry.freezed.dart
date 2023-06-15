// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEntry {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEntryCopyWith<TaskEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntryCopyWith<$Res> {
  factory $TaskEntryCopyWith(TaskEntry value, $Res Function(TaskEntry) then) =
      _$TaskEntryCopyWithImpl<$Res, TaskEntry>;
  @useResult
  $Res call(
      {int id,
      String title,
      TaskPriority priority,
      TaskStatus status,
      DateTime? dueDate});
}

/// @nodoc
class _$TaskEntryCopyWithImpl<$Res, $Val extends TaskEntry>
    implements $TaskEntryCopyWith<$Res> {
  _$TaskEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? priority = null,
    Object? status = null,
    Object? dueDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskEntryCopyWith<$Res> implements $TaskEntryCopyWith<$Res> {
  factory _$$_TaskEntryCopyWith(
          _$_TaskEntry value, $Res Function(_$_TaskEntry) then) =
      __$$_TaskEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      TaskPriority priority,
      TaskStatus status,
      DateTime? dueDate});
}

/// @nodoc
class __$$_TaskEntryCopyWithImpl<$Res>
    extends _$TaskEntryCopyWithImpl<$Res, _$_TaskEntry>
    implements _$$_TaskEntryCopyWith<$Res> {
  __$$_TaskEntryCopyWithImpl(
      _$_TaskEntry _value, $Res Function(_$_TaskEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? priority = null,
    Object? status = null,
    Object? dueDate = freezed,
  }) {
    return _then(_$_TaskEntry(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_TaskEntry extends _TaskEntry {
  const _$_TaskEntry(
      {this.id = 0,
      required this.title,
      required this.priority,
      required this.status,
      required this.dueDate})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  final String title;
  @override
  final TaskPriority priority;
  @override
  final TaskStatus status;
  @override
  final DateTime? dueDate;

  @override
  String toString() {
    return 'TaskEntry(id: $id, title: $title, priority: $priority, status: $status, dueDate: $dueDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, priority, status, dueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskEntryCopyWith<_$_TaskEntry> get copyWith =>
      __$$_TaskEntryCopyWithImpl<_$_TaskEntry>(this, _$identity);
}

abstract class _TaskEntry extends TaskEntry {
  const factory _TaskEntry(
      {final int id,
      required final String title,
      required final TaskPriority priority,
      required final TaskStatus status,
      required final DateTime? dueDate}) = _$_TaskEntry;
  const _TaskEntry._() : super._();

  @override
  int get id;
  @override
  String get title;
  @override
  TaskPriority get priority;
  @override
  TaskStatus get status;
  @override
  DateTime? get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$_TaskEntryCopyWith<_$_TaskEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
