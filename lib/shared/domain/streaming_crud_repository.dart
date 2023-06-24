import 'package:todo_app/shared/domain/crud_repository.dart';

abstract class StreamingCrudRepository<T> implements CrudRepository<T> {
  Stream<List<T>> getAllItemsStream();
}
