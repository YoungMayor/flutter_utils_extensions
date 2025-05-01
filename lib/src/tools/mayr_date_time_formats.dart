class MayrDateTimeFormats {
  /// United Kingdom's Standard Date format
  static String ukDate = "dd/MM/yyyy";

  /// United State's Standard Date format
  static String usDate = "yyyy-MM-dd";

  /// Time format
  static String time = "HH:mm:ss";

  /// Time format without seconds
  static String timeNoSecs = "HH:mm";

  /// United Kingdom's Standard Date format with time
  static String get ukDateTime => "$ukDate $time";

  /// United State's Standard Date format with time
  static String get usDateTime => "$usDate $time";
}
