// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_task_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlTaskEntryDto _$MlTaskEntryDtoFromJson(Map<String, dynamic> json) =>
    MlTaskEntryDto(
      pk: json['pk'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$MlTaskEntryDtoToJson(MlTaskEntryDto instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'title': instance.title,
      'body': instance.body,
    };
