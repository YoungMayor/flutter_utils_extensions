# BuildContext
- `FormState get form`
- `NavigatorState get navigator`
- `OverlayState get overlay`
- `ScaffoldState get scaffold`

## ScaffoldMessenger
- `ScaffoldMessengerState get scaffoldMessenger`
- `void showSnackBar(String content, {Duration? duration, SnackBarBehavior behavior = SnackBarBehavior.fixed})`

## Media Query
- `MediaQueryData get mediaQuery`
- `Brightness get platformBrightness`
- `bool get platformInDarkMode`
- `Size get widgetSize`
- `double get widgetHeight`
- `double get widgetWidth`

## Media Query Orientation
- `Orientation get orientation`
- `bool get isLandscape`
- `bool get isPortrait`
- `double get widgetShortestSide`
- `bool get isPhone`
- `bool get isSmallTablet`
- `bool get isLargeTablet`
- `bool get isTablet`
- `bool get isDesktop`

# DateTime

## Checkers
- `bool isAfternoon()`
- `bool isAgeBetween(int min, int max)`
- `bool isAgeEqualTo(int age)`
- `bool isAgeOlder(int age)`
- `bool isAgeYounger(int age)`
- `bool isEvening()`
- `bool isExpired()`
- `bool isInFuture()`
- `bool isInPast()`
- `bool isMorning()`
- `bool isNight()`
- `bool isSameDay(DateTime otherDate)`
- `bool isToday()`
- `bool isTomorrow()`
- `bool isYesterday()`

## Manipulators
- `DateTime addDays(int days)`
- `DateTime addHours(int hours)`
- `DateTime addMinutes(int minutes)`
- `DateTime addMonths(int months)`
- `DateTime addSeconds(int seconds)`
- `DateTime addYears(int years)`
-
- `DateTime subDays(int days)`
- `DateTime subHours(int hours)`
- `DateTime subMinutes(int minutes)`
- `DateTime subMonths(int months)`
- `DateTime subSeconds(int seconds)`
- `DateTime subYears(int years)`

## Time To String
- `int toAge()`
- `toDateString({String format = "yyyy-MM-d", String? locale})`
- `String toDateStringUK({String format = "dd/MM/yyyy", String? locale})`
- `String toDateStringUS({String format = "MM/dd/yyyy", String? locale})`
- `String toDateTimeString(String? locale)`
- `String toFormat(String format, {String? locale})`
- `String toDayOrdinal()`
- `String toTimeAgoString([String? locale])`
- `String toTimeString({bool withSeconds = false, String? locale})`
- `String toShortDate([String? locale])`

# Duration

- `Future delay([FutureOr Function()? callback]) async`

# Dynamic

- `T? nullOnDebug<T>()`
- `T? onlyOnDebug<T>()`
- `T? maybe<T>({double probability = 0.5})`

# Image
- ```dart
  CircleAvatar circleAvatar({
    Color? backgroundColor = Colors.transparent,
    double radius = 30.0,
    ImageErrorListener? onBackgroundImageError,
    ImageErrorListener? onForegroundImageError,
    Color? foregroundColor,
    double? minRadius,
    double? maxRadius,
  })
  ```


# Numbers

- `bool isEqual(num otherNum)`
- `bool isGreaterThan(num otherNum)`
- `bool isLessThan(num otherNum)`
- `num clampMin(num min)`
- `num clampMax(num max)`

## Double
- `double randomLess({double min = 1.0})`
- `double randomMore(double max)`

## Int
- `int randomLess({int min = 1.0})`
- `int randomMore(int max)`

## Number Format
- ```dart
  String formatAsCurrency({
    int decimalDigits = 2,
    String? locale,
    String? symbol,
  })
  ```
- `String formatAsDecimal({String? locale, int decimalDigits = 2})`
- `String formatAsNumber({String? locale})`

## Number to Duration
- `Duration get days`
- `Duration get hours`
- `Duration get microseconds`
- `Duration get milliseconds`
- `Duration get minutes`
- `Duration get seconds`

# String

- `bool matchesRegExp(String regex)`
- `bool toBool`
- `DateTime toDateTime()`
- `RegExp toRegExp()`
- `String limit(int maxLength, [String overflow = "..."])`
- ```dart
  String mask({
    int start = 2,
    int end = 2,
    String maskChar = '*',
    int? maskLength,
  })
  ```

## Pretty String

- `String prettyJson()`
- `String prettyXml()`
- `String prettyYaml()`

## Casing

- `String get camelCase`
- `String get capitalised`
- `String get kebabCase`
- `String get pascalCase`
- `String get snakeCase`
- `String get titleCase`

## Comparisons

- `bool get isCamelCase`
- `bool get isCapitalised`
- `bool get isKebabCase`
- `bool get isLowerCase`
- `bool get isNum`
- `bool get isPascalCase`
- `bool get isSnakeCase`
- `bool get isTitleCase`
- `bool get isUpperCase`

## Pattern Comparisons

- `bool get isAlphabetOnly`
- `bool get isEmail`
- `bool get isHexColor`
- `bool get isIPAddress`
- `bool get isNumericOnly`
- `bool get isSlug`
- `bool get isUlid`
- `bool get isUpperCase`
- `bool get isURL`
- `bool get isUuid`

# Widget

- `Center center({double? heightFactor, double? widthFactor})`
- `Expanded expanded([int flex = 1])`
- `Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose})`
- ```dart
  InkWellManager inkWellManager(
    void Function()? callback, {
    Color color = Colors.transparent,
  })
  ```
- `Opacity opacity(double opacity)`
- `Widget sizedBox({double? width, double? height})`
- ```dart
  Widget constrained({
    double? maxHeight,
    double? maxWidth,
    double? minHeight,
    double? minWidth,
  })
  ```

## Clip

- `ClipRect clipRect()`
- `ClipRRect clipRRect(BorderRadiusGeometry borderRadius)`
- `ClipRRect clipRounded([double radius = 12])`

## Padding

- `Widget paddingAll(double padding)`
- `Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0})`
- ` Widget paddingOnly({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0,})`
- `Widget paddingZero()`

## Positioning

- `Align positionAlign(AlignmentGeometry alignment)`
- `Positioned positionedFill()`

## Visibility

- `Widget hideIf(bool condition)`
- `Widget hideUnless(bool condition)`
- `Widget showIf(bool condition)`
- `Widget showUnless(bool condition)`
