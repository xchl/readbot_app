import 'package:readbot/common/index.dart';
import 'package:get/get.dart';

/// display datetime in human format
/// if the date of Datetime is the same as now, display "hour:minute"
/// if Datetime in last 7 days, display n days ago
/// if the year of datetime is the same as now, display month/day
/// else display year/month/day
String displayDatetime(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final lastWeek = DateTime(now.year, now.month, now.day - 7);
  final lastYear = DateTime(now.year - 1, now.month, now.day);

  // diff days between now and dateTime
  final days = today.difference(dateTime).inDays;

  if (dateTime.isAfter(today)) {
    // display hour:minute, 7:6 => 07:06
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  } else if (dateTime.isAfter(yesterday)) {
    return LocaleKeys.yesterday.tr;
  } else if (dateTime.isAfter(lastWeek)) {
    return LocaleKeys.daysAgo.trParams({"day": days.toString()});
  } else if (dateTime.isAfter(lastYear)) {
    return '${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}';
  } else {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}';
  }
}
