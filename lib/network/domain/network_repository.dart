import 'package:todo_app/shared/domain/crud_repository.dart';

abstract class NetworkRepository<T> extends CrudRepository<T> {
  /// method push data to server overriding data. Used to syncronize local and remote data.
  Future<void> patch(List<T> items);
}
