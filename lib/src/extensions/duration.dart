part of './../extensions.dart';

extension MayrDurationExtensions on Duration {
  Future delay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);
}
