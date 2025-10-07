# 🗓️ DateTime Extensions

Comprehensive utilities for working with dates and times.

## ✅ Checkers

- `isAfternoon` – Checks if the time is between 12:00 PM and 5:59 PM
- `isMorning` – Checks if the time is before 12:00 PM
- `isEvening` – Checks if the time is between 6:00 PM and 11:59 PM
- `isNight` – Checks if the time is between midnight and 5:59 AM
- `isToday` / `isTomorrow` / `isYesterday` – Quickly check the relation to the current day
- `isSameDay(DateTime other)` – Returns `true` if the date is the same calendar day as `other`
- `isInPast` / `isInFuture` – Check if the datetime is before or after now

## 🔧 Utilities

- `startOfDay()` – Returns the start of the day (midnight) for the datetime

## 🔧 Manipulators

### Adding Time

- `addDays(int)` / `addMonths(int)` / `addYears(int)` – Add to the datetime
- `addHours(int)` / `addMinutes(int)` / `addSeconds(int)` – Add smaller units

### Subtracting Time

- `subDays(int)` / `subMonths(int)` / `subYears(int)` – Subtract from the datetime
- `subHours(int)` / `subMinutes(int)` / `subSeconds(int)` – Subtract smaller units

## 🔢 Age

- `toAge()` – Convert the date to an age in years
- `isAgeOlder(age)` / `isAgeYounger(age)` / `isAgeEqualTo(age)` – Check against an age
- `isAgeBetween(min, max)` – Check if the age is within a given range

## 🧠 Time to String

- `format(String format)` – Fully custom format using `intl`

  > Popular date and time formats included in the [MayrDateTimeFormats] class.
  >
  > Currently includes:
  > - `MayrDateTimeFormats.ukDate` - dd/MM/yyyy
  > - `MayrDateTimeFormats.ukDateTime` - dd/MM/yyyy HH:mm:ss
  > - `MayrDateTimeFormats.usDate` - yyyy-MM-dd
  > - `MayrDateTimeFormats.usDateTime` - yyyy-MM-dd HH:mm:ss
  > - `MayrDateTimeFormats.time` - HH:mm:ss
  > - `MayrDateTimeFormats.timeNoSecs` - HH:mm

- `toDayOrdinal()` – Get the day of the month with ordinal (e.g. `1st`, `22nd`, `31st`)
- `toTimeAgoString()` – Human-readable "time ago" format (e.g. "2 days ago")
- `toTimeString()` – Convert to time only (e.g. `14:35` or `14:35:59`)
- `toShortDate()` – Returns a short formatted date string (e.g. `Wed 15th Jan`)

## Back to Documentation

[← Back to main documentation](./README.md)
