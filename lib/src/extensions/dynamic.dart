part of './../extensions.dart';

extension MayrDynamicExtensions on dynamic {
  T? nullOnDebug<T>() => kDebugMode ? null : this;
  T? onlyOnDebug<T>() => kDebugMode ? this : null;

  /// Randomly returns null or value based on the given probability
  /// `probability` is a double between 0.0 and 1.0
  T? maybe<T>({double probability = 0.5}) =>
      Random().nextDouble() < probability ? this : null;
}

extension MayrSafeValueExtensions<T> on T? {
  /// Return the fallback value if the provided value is null
  T orDefault(T fallback) => this ?? fallback;
}
