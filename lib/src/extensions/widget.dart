part of './../extensions.dart';

extension WidgetExtensions on Widget {
  Center center({double? heightFactor, double? widthFactor}) =>
      Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);

  Expanded expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: 1, fit: fit, child: this);

  InkWellManager inkWell(
    void Function()? callback, {
    Color color = Colors.transparent,
  }) => InkWellManager(this, callback, color: color);

  Opacity opacity(double opacity) => Opacity(opacity: opacity, child: this);

  Widget sizedBox({double? width, double? height}) =>
      SizedBox(height: height, width: width, child: this);

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

extension WidgetClipExtensions on Widget {
  ClipRect clipRect() => ClipRect(child: this);

  ClipRRect clipRRect(BorderRadiusGeometry borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  ClipRRect clipRounded([double radius = 12]) =>
      clipRRect(BorderRadius.circular(radius));
}

extension WidgetPaddingExtensions on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

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

  Widget paddingZero() => Padding(padding: EdgeInsets.zero, child: this);
}

extension WidgetPositionExtensions on Widget {
  Align positionAlign(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  Positioned positionedFill() => Positioned.fill(child: this);
}

extension WidgetVisibilityExtensions on Widget {
  Widget hideIf(bool condition) => showIf(!condition);

  Widget hideUnless(bool condition) => showIf(condition);

  Widget showIf(bool condition) => condition ? this : const SizedBox.shrink();

  Widget showUnless(bool condition) => showIf(!condition);
}
