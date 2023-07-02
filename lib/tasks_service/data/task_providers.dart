import 'dart:async';
import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/local_storage/data/local_storage_provider.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/tasks_service/data/task_service_local_remote.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

final taskEntryServiceProvider = Provider<TaskEntryService>(
  (ref) {
    final local = ref.watch(localStorageProvider);
    const NetworkRepository<TaskEntry>? remote = null;
    // ref.watch(networkTasksRepositoryProvider).valueOrNull;
    final taskCategories = ref.watch(taskCategoriesProvider);
    final service = TaskEntryServiceLocalRemote(
      local: local,
      remote: remote,
      taskCategories: taskCategories,
    );
    if (remote != null) {
      /// start syncronization when service required. Since offline first approach, ui will get data from local db
      unawaited(service.syncronizeTaskEntries());
    }

    return service;
  },
);

final taskEntryStreamProvider = StreamProvider<List<TaskEntry>>(
  (ref) {
    return ref.watch(taskEntryServiceProvider).getTaskEntriesStream();
  },
);

final doneTasksVisibilityProvider = StateProvider<bool>((ref) => true);

final taskCategoriesProvider = StateProvider<List<String>>(
  (ref) {
    return UnmodifiableListView([
      'todo',
      'in progress',
      'trash',
      'done',
      'todo 2',
      'in progress 2',
      'trash 2',
      'done 2',
    ]);
  },
);
