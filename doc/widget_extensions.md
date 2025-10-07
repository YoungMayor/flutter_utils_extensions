# 🧩 Widget Extensions

Extensions for transforming and enhancing Flutter widgets.

## 🪄 Basic Transformations

- `center({heightFactor, widthFactor})` – Wraps widget in a `Center`
- `expanded([flex = 1])` – Wraps widget in an `Expanded`
- `flexible({flex = 1, fit = FlexFit.loose})` – Wraps widget in a `Flexible`
- `opacity(opacity)` – Wraps widget with an `Opacity` widget
- `sizedBox({width, height})` – Wraps widget with a `SizedBox`
- `constrained({maxHeight, maxWidth, minHeight, minWidth})` – Wraps widget with a `ConstrainedBox`

## ✂️ Clipping

- `clipRect()` – Clips widget to a rectangle
- `clipRRect(borderRadius)` – Clips widget with rounded corners
- `clipRounded([radius = 12])` – Quickly clip widget with a uniform rounded border

## 🧹 Padding

- `paddingAll(padding)` – Adds equal padding on all sides
- `paddingSymmetric({horizontal, vertical})` – Adds symmetric horizontal and vertical padding
- `paddingOnly({left, top, right, bottom})` – Custom padding for specific sides
- `paddingZero()` – Adds zero padding

## 🧭 Positioning

- `positionAlign(alignment)` – Aligns widget using `Align`
- `positionedFill()` – Fills parent constraints using `Positioned.fill`

## 👻 Visibility Helpers

- `hideIf(condition)` – Hides widget (returns `SizedBox.shrink()`) if `condition` is true
- `hideUnless(condition)` – Hides widget unless `condition` is true
- `showIf(condition)` – Shows widget if `condition` is true, otherwise hides
- `showUnless(condition)` – Shows widget unless `condition` is true

## 🔘 inkwellManager on Widget

A helper class for managing taps on a widget in a cleaner way.

- `inkWellManager(callback, {color = Colors.transparent})` – Wraps widget with an `InkWell` for tap detection
- `onTap()` – Wraps child with `InkWell` for tap gesture
- `onDoubleTap()` – Wraps child with `InkWell` for double-tap gesture
- `onLongPress()` – Wraps child with `InkWell` for long-press gesture

> **Tip:** Used alongside the `inkWellManager` extension to easily attach tap interactions without boilerplate.

### Example

```dart
Text('Click Me')
  .inkWellManager(() => print('Tapped'), color: Colors.black)
  .onTap();
```

### 💡 Why InkWellManager?

Normally, to make a widget respond to taps, you must manually wrap it inside an InkWell every time, setting colours and callbacks. InkWellManager simplifies this by providing quick `.onTap()`, `.onDoubleTap()`, and `.onLongPress()` methods — making your code shorter, cleaner, and more maintainable.

It also auto-applies the same splash, hover, and focus colours without extra setup.

## Back to Documentation

[← Back to main documentation](./README.md)
