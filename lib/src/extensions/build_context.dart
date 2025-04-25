part of './../extensions.dart';

extension BuildContextExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  FormState get form => Form.of(this);

  OverlayState get overlay => Overlay.of(this);
}

extension ContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Size

  Size get widgetSize => mediaQuery.size;

  double get widgetWidth => widgetSize.width;

  double get widgetHeight => widgetSize.height;

  // Brightness

  Brightness get platformBrightness => mediaQuery.platformBrightness;

  bool get isDeviceInDarkMode => platformBrightness == Brightness.dark;
}

extension ContextMediaQueryOrientationExtensions on BuildContext {
  Orientation get orientation => mediaQuery.orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// get the shortestSide from screen
  double get widgetShortestSide => widgetSize.shortestSide;

  /// True if the shortestSide is smaller than 600p
  bool get isPhone => widgetShortestSide < 600;

  /// True if the shortestSide is largest than 600p
  bool get isSmallTablet => widgetShortestSide >= 600;

  /// True if the shortestSide is largest than 720p
  bool get isLargeTablet => widgetShortestSide >= 720;

  /// True if the current device is Tablet
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// True if current device is Desktop
  bool get isDesktop => widgetShortestSide >= 1200;
}
