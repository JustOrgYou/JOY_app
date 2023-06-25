import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/network_merger/domain/network_merger_list_request_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_list_response_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_request_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_response_dto.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

typedef _Json = Map<String, dynamic>;

/// this class tends to behave like a local repository, but under the hood differences are significant.
///
class NetworkTasksRepositoryMerger implements NetworkRepository<TaskEntry> {
  final Dio dio;

  /// if we would log all syncronizations value notifier may become helpful. But it is
  /// quite pointless otherwise.
  ValueNotifier<int> revision;

  NetworkTasksRepositoryMerger({
    required this.dio,
    int? lastKnownRevision,
  }) : revision = ValueNotifier(lastKnownRevision ?? 0);

  @override
  Future<void> clearItems() async {
    await patch([]);
  }

  @override
  Future<bool> deleteOne(TaskEntry item) async {
    final response = await dio.delete<_Json>(
      '/list/${item.id}',
      options: _revisionHeader(),
    );

    return response.statusCode == 200;
  }

  @override
  Future<List<TaskEntry>> getAllItems() async {
    final response = await dio.get<_Json>('/list');
    final parsedResponse = NetworkMergerListResponseDto.fromJson(
      response.data!,
    );
    return parsedResponse.list.map<TaskEntry>((e) => e.toTaskEntry()).toList();
  }

  @override
  Future<void> updateOne(TaskEntry item) async {
    final response = await dio.put<_Json>(
      '/list/${item.id}',
      options: _revisionHeader(),
      data: _taskRequestDto(item),
    );
    final parsedResponse = NetworkMergerTaskResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
  }

  @override
  Future<void> createOne(TaskEntry item) async {
    final response = await dio.post<_Json>(
      '/list',
      options: _revisionHeader(),
      data: _taskRequestDto(item),
    );
    final parsedResponse = NetworkMergerTaskResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
  }

  @override
  Future<void> patch(List<TaskEntry> items) async {
    final response = await dio.patch<_Json>(
      '/list',
      options: _revisionHeader(),
      data: NetworkMergerListRequestDto(
        list: items.map(NetworkMergerTaskDto.fromTaskEntry).toList(),
      ).toJson(),
    );
    final parsedResponse = NetworkMergerListResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
  }

  Options _revisionHeader() {
    return Options(
      headers: <String, String>{
        'X-Last-Known-Revision': revision.value.toString(),
      },
    );
  }

  NetworkMergerTaskRequestDto _taskRequestDto(TaskEntry taskEntry) {
    return NetworkMergerTaskRequestDto(
      task: NetworkMergerTaskDto.fromTaskEntry(taskEntry),
    );
  }
}
