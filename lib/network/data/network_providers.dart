import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/network_merger/data/network_tasks_repository_merger.dart';
import 'package:todo_app/shared/data/config_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

/// Network logic is isolated from the rest of the app. But Dio is freely used
/// across the network layer.
final dioProvider = Provider<Dio>(
  (ref) {
    final appConfig = ref.watch(appConfigProvider);
    return Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: appConfig.connectTimeout,
        receiveTimeout: appConfig.receiveTimeout,
        headers: <String, String>{
          /// token should include 'Bearer' or 'OAuth' prefix
          'Authorization': appConfig.authToken,
        },
      ),
    );
  },
);

final networkTasksRepositoryMergerProvider =
    Provider<NetworkRepository<TaskEntry>>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return NetworkTasksRepositoryMerger(
      dio: dio,

      /// TODO: get last known revision from db
      lastKnownRevision: null,
    );
  },
);
