// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerTaskDto _$NetworkMergerTaskDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerTaskDto(
      id: json['id'] as int,
      text: json['text'] as String,
      importance: json['importance'] as String,
      deadline: json['deadline'] as int?,
      done: json['done'] as bool,
      color: json['color'] as String?,
      createdAt: json['created_at'] as int,
      changedAt: json['changed_at'] as int,
      lastUpdatedBy: json['last_updated_by'] as int,
    );

Map<String, dynamic> _$NetworkMergerTaskDtoToJson(
        NetworkMergerTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': instance.importance,
      'deadline': instance.deadline,
      'done': instance.done,
      'color': instance.color,
      'created_at': instance.createdAt,
      'changed_at': instance.changedAt,
      'last_updated_by': instance.lastUpdatedBy,
    };
