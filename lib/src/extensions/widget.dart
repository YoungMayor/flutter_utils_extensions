part of './../extensions.dart';

extension MayrWidgetExtensions on Widget {
  /// Wraps this widget in a [Center] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').center();
  /// ```
  Center center({double? heightFactor, double? widthFactor}) =>
      Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);

  /// Wraps this widget in an [Expanded] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').expanded(2); // Takes 2x the space of other expanded widgets
  /// ```
  Expanded expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Wraps this widget in a [Flexible] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').flexible(flex: 2, fit: FlexFit.tight);
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: 1, fit: fit, child: this);

  /// Wraps this widget with an [InkWellManager] for touch interactions.
  ///
  /// Example:
  /// ```dart
  /// Text('Click me').inkWellManager(() => print('Tapped!'));
  /// ```
  InkWellManager inkWellManager(
    void Function()? callback, {
    Color color = Colors.transparent,
  }) => InkWellManager(this, callback, color: color);

  /// Wraps this widget in an [Opacity] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').opacity(0.5); // Makes text semi-transparent
  /// ```
  Opacity opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Wraps this widget in a [SizedBox] with optional width and height.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').sizedBox(width: 100, height: 50);
  /// ```
  Widget sizedBox({double? width, double? height}) =>
      SizedBox(height: height, width: width, child: this);

  /// Wraps this widget in a [ConstrainedBox] with optional constraints.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').constrained(maxWidth: 200, minHeight: 50);
  /// ```
  Widget constrained({
    double? maxHeight,
    double? maxWidth,
    double? minHeight,
    double? minWidth,
  }) => ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? double.infinity,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      minWidth: minWidth ?? 0,
    ),
    child: this,
  );
}

extension MayrWidgetClipExtensions on Widget {
  /// Wraps this widget in a [ClipRect] widget.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRect();
  /// ```
  ClipRect clipRect() => ClipRect(child: this);

  /// Wraps this widget in a [ClipRRect] widget with custom border radius.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRRect(BorderRadius.circular(20));
  /// ```
  ClipRRect clipRRect(BorderRadiusGeometry borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  /// Wraps this widget in a [ClipRRect] widget with circular border radius.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRounded(15); // 15 pixel radius
  /// ```
  ClipRRect clipRounded([double radius = 12]) =>
      clipRRect(BorderRadius.circular(radius));
}

extension MayrWidgetPaddingExtensions on Widget {
  /// Wraps this widget in a [Padding] widget with equal padding on all sides.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingAll(16.0);
  /// ```
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  /// Wraps this widget in a [Padding] widget with symmetric padding.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingSymmetric(horizontal: 20, vertical: 10);
  /// ```
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Wraps this widget in a [Padding] widget with specific padding on each side.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingOnly(left: 10, top: 5, right: 10, bottom: 5);
  /// ```
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  /// Wraps this widget in a [Padding] widget with zero padding.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingZero();
  /// ```
  Widget paddingZero() => Padding(padding: EdgeInsets.zero, child: this);
}

extension MayrWidgetPositionExtensions on Widget {
  /// Wraps this widget in an [Align] widget with the specified alignment.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').positionAlign(Alignment.topLeft);
  /// ```
  Align positionAlign(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  /// Wraps this widget in a [Positioned.fill] widget.
  ///
  /// Example:
  /// ```dart
  /// Container().positionedFill();
  /// ```
  Positioned positionedFill() => Positioned.fill(child: this);
}

extension MayrWidgetVisibilityExtensions on Widget {
  /// Hides this widget if the [condition] is true, otherwise shows it.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').hideIf(isHidden);
  /// ```
  Widget hideIf(bool condition) => showIf(!condition);

  /// Hides this widget unless the [condition] is true.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').hideUnless(isVisible);
  /// ```
  Widget hideUnless(bool condition) => showIf(condition);

  /// Shows this widget if the [condition] is true, otherwise hides it.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').showIf(isVisible);
  /// ```
  Widget showIf(bool condition) => condition ? this : const SizedBox.shrink();

  /// Shows this widget unless the [condition] is true.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').showUnless(isHidden);
  /// ```
  Widget showUnless(bool condition) => showIf(!condition);
}
