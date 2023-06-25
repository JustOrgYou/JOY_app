import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/network/data/network_tasks_repository_merger.dart';
import 'package:todo_app/shared/data/config_providers.dart';

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
    Provider<NetworkTasksRepositoryMerger>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return NetworkTasksRepositoryMerger(
      dio: dio,
    );
  },
);
