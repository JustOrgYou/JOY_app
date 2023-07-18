extension ListMaybeGetExtension<T> on List<T> {
  T? maybeGet(int index) {
    if (index < length) {
      return this[index];
    }
    return null;
  }
}
