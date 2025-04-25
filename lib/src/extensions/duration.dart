part of './../extensions.dart';

extension DurationExtensions on Duration {
  Future delay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);
}
