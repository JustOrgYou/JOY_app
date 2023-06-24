import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/app_theme.dart';
import 'package:todo_app/local_storage/data/local_storage_isar.dart';
import 'package:todo_app/local_storage/data/local_storage_provider.dart';
import 'package:todo_app/tasks_overview/tasks_overview.dart';

Future<List<Override>> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize local storage
  final localStorage = LocalStorageIsar();
  await localStorage.initialize();
  return [
    localStorageProvider.overrideWithValue(localStorage),
  ];
}

void main() async {
  runApp(
    MyApp(
      overrides: await setup(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<Override> overrides;
  const MyApp({
    required this.overrides,
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const TasksOverview(),
      ),
    );
  }
}
