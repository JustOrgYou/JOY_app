import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/local_storage/domain/local_storage.dart';
import 'package:todo_app/local_storage/domain/local_task_entry.dart';

class LocalStorageIsar implements LocalStorage {
  late Isar _isar;

  @override
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        LocalTaskEntrySchema,
      ],
      directory: dir.path,
    );
  }
}
