part of './../extensions.dart';

extension MayrImageWidgetExtensions on Image {
  /// Create a circle avatar.
  CircleAvatar circleAvatar({
    Color? backgroundColor = Colors.transparent,
    double radius = 30.0,
    ImageErrorListener? onBackgroundImageError,
    ImageErrorListener? onForegroundImageError,
    Color? foregroundColor,
    double? minRadius,
    double? maxRadius,
  }) => CircleAvatar(
    radius: radius,
    backgroundImage: image,
    backgroundColor: Colors.transparent,
    onBackgroundImageError: onBackgroundImageError,
    onForegroundImageError: onForegroundImageError,
    foregroundColor: foregroundColor,
    minRadius: minRadius,
    maxRadius: maxRadius,
  );
}
