import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class SXDate {
  static Future<DateTime> datePicker(BuildContext context, DateTime date) async {
    DateTime? result = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );
    result ??= date;
    return result;
  }

  static Future<TimeOfDay> timePicker(BuildContext context, TimeOfDay time) async {
    TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: time,
    );
    result ??= time;
    return result;
  }

  /// 前几个月集合
  static List<String> getMonths(
    String type,
    DateTime date,
    int i,
  ) {
    List<String> dates = [];
    DateFormat dateFormat = DateFormat(type);
    DateTime sixMonthFromNow = DateTime(date.year, date.month - i);
    while (date.isAfter(sixMonthFromNow)) {
      dates.add(dateFormat.format(date));
      date = DateTime(date.year, date.month - 1);
    }
    return dates.reversed.toList();
  }

  /// 某个时间（精确到天）
  static String getTime(
    String type,
    int year,
    int month,
    int day,
  ) {
    String date = '';
    DateFormat dateFormat = DateFormat(type);
    DateTime monthsBeforeNow = DateTime(year, month, day);
    date = dateFormat.format(monthsBeforeNow);
    return date;
  }

  /// 获取一个月有多少天
  static int getDayCounts(int month) {
    int year = DateTime.now().year;
    int end = 0;
    if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      end = 31;
    } else if (month == 2) {
      if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
        end = 29;
      } else {
        end = 28;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      end = 30;
    }
    return end;
  }
}
