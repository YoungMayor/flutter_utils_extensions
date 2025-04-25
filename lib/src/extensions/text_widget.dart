part of './../extensions.dart';

extension CustomTextWidget on Text {
  // Text copyWith({
  //   Key? key,
  //   StrutStyle? strutStyle,
  //   TextAlign? textAlign,
  //   TextDirection? textDirection = TextDirection.LTR,
  //   Locale? locale,
  //   bool? softWrap,
  //   TextOverflow? overflow,
  //   TextScaler? textScaler,
  //   int? maxLines,
  //   String? semanticsLabel,
  //   TextWidthBasis? textWidthBasis,
  //   TextStyle? style,
  // }) {
  //   return Text(
  //     data ?? "",
  //     key: key ?? this.key,
  //     strutStyle: strutStyle ?? this.strutStyle,
  //     textAlign: textAlign ?? this.textAlign,
  //     // textDirection: textDirection ?? this.textDirection,
  //     locale: locale ?? this.locale,
  //     softWrap: softWrap ?? this.softWrap,
  //     overflow: overflow ?? this.overflow,
  //     textScaler: textScaler ?? this.textScaler,
  //     maxLines: maxLines ?? this.maxLines,
  //     semanticsLabel: semanticsLabel ?? this.semanticsLabel,
  //     textWidthBasis: textWidthBasis ?? this.textWidthBasis,
  //     style: style != null ? this.style?.merge(style) ?? style : this.style,
  //   );
  // }

  /// Make the font bold.
  // Text fontWeightBold() {
  //   return copyWith(style: const TextStyle(fontWeight: FontWeight.bold));
  // }

  // /// Make the font light.
  // Text fontWeightLight() {
  //   return copyWith(style: const TextStyle(fontWeight: FontWeight.w300));
  // }

  /// Change the [style].
  // Text setStyle(TextStyle? style) => copyWith(style: style);

  // /// Aligns text to the left.
  // Text alignLeft() {
  //   return copyWith(textAlign: TextAlign.left);
  // }

  // /// Aligns text to the right.
  // Text alignRight() {
  //   return copyWith(textAlign: TextAlign.right);
  // }

  // /// Aligns text to the center.
  // Text alignCenter() {
  //   return copyWith(textAlign: TextAlign.center);
  // }

  // /// Aligns text to the center.
  // Text setMaxLines(int maxLines) {
  //   return copyWith(maxLines: maxLines);
  // }

  /// Add padding to the text.
  Padding paddingOnly({
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

  // Text setColor(Color? newColor) =>
  //     copyWith(style: style?.copyWith(color: newColor));

  // Text setAlpha(int alpha) {
  //   Color? currentColor = style?.color;

  //   if (currentColor == null) return this;

  //   return copyWith(
  //     style: style?.copyWith(color: currentColor.withAlpha(alpha)),
  //   );
  // }

  // Text mediumEmphasis() => setAlpha(170);
  // Text lowEmphasis() => setAlpha(85);

  // Text overflowEllipsis() => copyWith(overflow: TextOverflow.ellipsis);
  // Text overflowFade() => copyWith(overflow: TextOverflow.fade);

  // Text setSoftWrap([bool value = true]) => copyWith(softWrap: value);

  // Text fontItalic() =>
  //     copyWith(style: style?.copyWith(fontStyle: FontStyle.italic));

  // // Decorations

  // Text underline() =>
  //     copyWith(style: style?.copyWith(decoration: TextDecoration.underline));

  // Text overline() =>
  //     copyWith(style: style?.copyWith(decoration: TextDecoration.overline));

  // Text lineThrough() =>
  //     copyWith(style: style?.copyWith(decoration: TextDecoration.lineThrough));

  // Spacings

  // Text letterSpacing(double spacing) =>
  //     copyWith(style: style?.copyWith(letterSpacing: spacing));

  // Text wordSpacing(double spacing) =>
  //     copyWith(style: style?.copyWith(wordSpacing: spacing));
}
