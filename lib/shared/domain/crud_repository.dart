/// App global entity, store all models from upper level and provide
/// abstraction from concrete DB implementation.
abstract class CrudRepository<T> {
  /// update existing item. If not found, creates new one.
  Future<void> putOne(T item);

  /// update existing items, optimized for multiple tasks. If not found, creates new ones.
  Future<void> putMany(List<T> items);

  /// delete existing item
  Future<bool> deleteOne(T item);

  /// delete existing items, optimized for multiple tasks. Not found tasks will be returned.
  Future<List<T>> deleteMany(List<T> items);

  /// get all items
  Future<List<T>> getAllItems();

  /// delete all items
  Future<void> clearItems();
}
