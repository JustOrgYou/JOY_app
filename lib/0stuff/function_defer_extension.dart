extension DeferFunctionExtension<R> on R Function() {
  /// Defer the execution of the function to the future event handler.
  /// It is useful to call function after current context end.
  /// This uses event loop feature, remember that isolates has own event loop.
  /// Be aware that during async calls this function will execute! So it is recommended to use it
  /// in sync calls only.
  /// For example if you want to show snackbar when callback is ended (independently from result).
  void defer() {
    Future<void>.delayed(Duration.zero, this);
  }
}
