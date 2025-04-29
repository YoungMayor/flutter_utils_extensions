part of './../extensions.dart';

extension MayrBuildContextExtensions on BuildContext {
  /// Get the closest [NavigatorState] up the widget tree
  NavigatorState get navigator => Navigator.of(this);

  /// Get the nearest [ScaffoldState] up the widget tree
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Get the nearerst [FormState] up the widget tree
  FormState get form => Form.of(this);

  /// Get the nearerst [OverlayState] up the widget tree
  OverlayState get overlay => Overlay.of(this);
}

extension MayrContextScaffoldMessengerExtensions on BuildContext {
  /// Get the nearest scaffold messenger
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Helper function for showing snackbar
  void showSnackBar(
    String content, {
    Duration? duration,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) => scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(content),
      duration: duration ?? 4.seconds,
      behavior: behavior,
    ),
  );
}

extension MayrContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Size

  Size get widgetSize => mediaQuery.size;

  double get widgetWidth => widgetSize.width;

  double get widgetHeight => widgetSize.height;

  // Brightness

  Brightness get platformBrightness => mediaQuery.platformBrightness;

  bool get platformInDarkMode => platformBrightness == Brightness.dark;
  bool get platformInLightMode => platformBrightness == Brightness.light;
}

extension MayrContextMediaQueryOrientationExtensions on BuildContext {
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
