part of './../extensions.dart';

extension MayrDynamicExtensions on dynamic {
  /// Returns null only in debug mode; retains value in release/profile mode.
  ///
  /// This is useful for testing nullable flows while maintaining
  /// actual values in production.
  ///
  /// Example:
  /// ```dart
  /// final userId = getUserId().nullOnDebug<String>();
  /// // In debug mode: null
  /// // In release mode: actual user ID
  /// ```
  T? nullOnDebug<T>() => kDebugMode ? null : this;

  /// Returns the value only in debug mode, otherwise returns null.
  ///
  /// This is useful for debug-only features or values.
  ///
  /// Example:
  /// ```dart
  /// final debugInfo = getDebugInfo().onlyOnDebug<String>();
  /// // In debug mode: actual debug info
  /// // In release mode: null
  /// ```
  T? onlyOnDebug<T>() => kDebugMode ? this : null;

  /// Randomly returns null or value based on the given probability.
  ///
  /// The [probability] parameter should be a double between 0.0 and 1.0,
  /// representing the chance of returning null.
  ///
  /// This is great for simulating unreliable data in tests or dev mode.
  ///
  /// Example:
  /// ```dart
  /// final value = 'Simulate me'.maybe(probability: 0.3);
  /// // Has a 30% chance of being null
  ///
  /// final result = fetchData().maybe<User>();
  /// // Has a 50% chance (default) of being null
  /// ```
  T? maybe<T>({double probability = 0.5}) =>
      Random().nextDouble() < probability ? null : this;
}

extension MayrSafeValueExtensions<T> on T? {
  /// Returns the fallback value if this value is null.
  ///
  /// This provides a clean way to handle nullable values with a default.
  ///
  /// Example:
  /// ```dart
  /// String? name = null;
  /// print(name.orDefault('Guest')); // 'Guest'
  ///
  /// String? username = 'John';
  /// print(username.orDefault('Guest')); // 'John'
  /// ```
  T orDefault(T fallback) => this ?? fallback;
}
