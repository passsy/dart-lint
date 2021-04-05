/// Indicates to tools that [future] is intentionally not `await`-ed.
///
/// In an `async` context, it is normally expected that all [Future]s are
/// awaited, and that is the basis of the lint `unawaited_futures`. However,
/// there are times where one or more futures are intentionally not awaited.
/// This function may be used to ignore a particular future. It silences the
/// `unawaited_futures` lint.
///
/// ## Usage
///
/// ```dart
/// Future<void> logAsync(String msg) async { /*...*/ }
///
/// Future<void> someOperation() async {
///   await doSomething();
///
///   // This alone triggers the lint because await is missing
///   logAsync('success');
///
///   // The fireAndForget() function signals that await is intentionally missing
///   fireAndForget(logAsync('success'));
/// }
/// ```
///
/// ## Extension vs. wrapper function
///
/// `fireAndForget` can also be used as extension, see [FireAndForget].
///
/// The extensions should be preferred as it is
/// - easier to read and
/// - doesn't break formatting of method chains.
/// src: https://github.com/dart-lang/sdk/issues/32280#issuecomment-372060804
///
/// The top-level function is useful because it gets autocompleted in IDEs without writing the import first.
/// This is still not possible for extension functions https://github.com/dart-lang/sdk/issues/38894.
void fireAndForget<T>(Future<void>? future) {}

/// Hosts the `fireAndForget` extension to silence the `unawaited_futures` warning.
extension FireAndForget on Future<void>? {
  /// Indicates to tools that [Future] is intentionally not `await`-ed.
  ///
  /// In an `async` context, it is normally expected that all [Future]s are
  /// awaited, and that is the basis of the lint `unawaited_futures`. However,
  /// there are times where one or more futures are intentionally not awaited.
  /// This function may be used to ignore a particular future. It silences the
  /// `unawaited_futures` lint.
  ///
  /// ## Usage
  ///
  /// ```dart
  /// Future<void> logAsync(String msg) async { /*...*/ }
  ///
  /// Future<void> someOperation() async {
  ///   await doSomething();
  ///
  ///   // This alone triggers the lint because await is missing
  ///   logAsync('success');
  ///
  ///   // The fireAndForget() extensions signals that await is intentionally missing
  ///   logAsync('success').fireAndForget();
  /// }
  /// ```
  ///
  /// `fireAndForget` is also available as top-level function `fireAndForget()` which wraps a Future
  void fireAndForget() {}
}
