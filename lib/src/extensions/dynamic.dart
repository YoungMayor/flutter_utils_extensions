part of './../extensions.dart';

extension CustomDynamic on dynamic {
  T? nullOnDebug<T>() => kDebugMode ? null : this;
  T? onlyOnDebug<T>() => kDebugMode ? this : null;

  T? maybe<T>({double probability = 0.5}) =>
      Random().nextDouble() < probability ? this : null;
}
