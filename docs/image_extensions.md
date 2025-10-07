# 🖼️ Image Extensions

Extensions for working with `ImageProvider` objects.

## Methods

- `circleAvatar({ ... })` – Quickly convert an `ImageProvider` to a `CircleAvatar` widget with full customisation options

## Parameters

- `backgroundColor` – Background colour of the avatar (default is transparent)
- `radius` – Sets the circular radius of the avatar
- `minRadius` / `maxRadius` – Optional constraints
- `foregroundColor` – Colour for the foreground image
- `onBackgroundImageError` / `onForegroundImageError` – Handle image load failures

## Examples

```dart
// Create a circle avatar from a network image
NetworkImage('https://example.com/pic.jpg').circleAvatar(radius: 40);
```

## Back to Documentation

[← Back to main documentation](./README.md)
