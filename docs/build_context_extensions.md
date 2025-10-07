# 🧱 BuildContext Extensions

Extensions that make working with `BuildContext` easier and more expressive.

## Quick Access Properties

### Form & Navigation

- `form` – Easily access the nearest `FormState` using `context.form`
- `navigator` – Shorthand for `Navigator.of(context)`
- `overlay` – Access the current `OverlayState` from the context
- `scaffold` – Retrieve the nearest `ScaffoldState` with `context.scaffold`

## ScaffoldMessenger

- `scaffoldMessenger` – Quickly get the `ScaffoldMessengerState` for showing snackbars and more
- `void showSnackBar(String content, {Duration? duration, SnackBarBehavior behavior = SnackBarBehavior.fixed})` - Quickly show a SnackBar without manually accessing ScaffoldMessenger

## Media Query

Access media query information with ease:

- `mediaQuery` – Access `MediaQueryData` from context
- `platformBrightness` – Get the system's brightness setting (`Brightness.dark` or `Brightness.light`)
- `platformInDarkMode` | `platformInLightMode` – Returns `true` based on the app's current brightness mode
- `widgetSize` – Get the rendered size of the widget associated with the context
- `widgetHeight` – Convenience getter for just the height of the widget
- `widgetWidth` – Convenience getter for just the width

## Media Query Orientation

- `orientation` – Access the current screen orientation (`portrait` or `landscape`)
- `isLandscape` / `isPortrait` – Easy checks for current orientation
- `widgetShortestSide` – Useful for responsive layouts based on the device's shortest screen edge
- `isPhone` – Returns `true` if the device is considered a phone
- `isSmallTablet`, `isLargeTablet` – Classify tablets based on width
- `isTablet` – Shortcut combining both small and large tablets
- `isDesktop` – Detects larger screens, typically desktops

## Back to Documentation

[← Back to main documentation](./README.md)
