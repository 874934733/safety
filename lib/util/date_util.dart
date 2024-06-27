import 'log_util.dart';

class DateUtil {
  DateUtil._();

  ///日期转换为yyyy-MM-dd HH:mm:ss格式
  static String dateToStr(DateTime date) {
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
  }

  ///日期转换为yyyy-MM-dd HH:mm格式
  static String dateToStrs(DateTime date) {
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  ///2021-10-21T08:50:55.000+00:00转换成2021-10-21 16:50:26格式
  static String dateFormat(String src) {
    String desc = '';
    if (src.isNotEmpty) {
      try {
        desc = src.split('.')[0].replaceAll('T', ' ');
      } catch (e) {
        WanLog.e(e.toString());
        desc = '';
      }
    }
    return desc;
  }

  ///2021-10-21T08:50:55.000+00:00转换成2021-10-21格式
  static String dateFormatYMD(String src) {
    String desc = '';
    if (src.isNotEmpty) {
      try {
        if (src.contains('T')) {
          desc = src.split('T')[0];
        } else if (src.contains(' ')) {
          desc = src.split(' ')[0];
        } else {
          desc = src;
        }
      } catch (e) {
        WanLog.e(e.toString());
        desc = '';
      }
    }
    return desc;
  }

  ///日期转换为yyyy-MM-dd格式
  static String dateToYMD(DateTime date) {
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  ///日期转换为yyyy-MM格式
  static String dateToYM(DateTime date) {
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}';
  }

  ///日期转换为yyyy年MM月dd日格式
  static String dateToYMDCN(DateTime date) {
    return '${date.year.toString()}年${date.month.toString().padLeft(2, '0')}月${date.day.toString().padLeft(2, '0')}日';
  }

  ///日期转换为yyyyMMdd格式
  static String dateToYMDNum(DateTime date) {
    return '${date.year.toString()}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }

  ///时间戳转化为yyy-MM-dd HH:mm:ss格式
  static String getNowAppointmentDate(int millisecondsSinceEpoch) {
    var time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return DateUtil.dateToStrs(time);
  }

  ///计算3天后日期
  static String threeDaysLater() {
    // 获取当前日期
    DateTime now = DateTime.now();
    // 计算 3 天后的日期
    DateTime threeDaysLater = now.add(const Duration(days: 3));
    return dateToYMD(threeDaysLater);
  }

  /// 获取当前日期
  static String nowDays() {
    DateTime now = DateTime.now();
    return dateToYMD(now);
  }

  /// 获取当前日期
  static String getNowDays() {
    DateTime now = DateTime.now();
    return dateToStr(now);
  }

  /// 获取当前月份日期
  static String nowMonthDays() {
    DateTime now = DateTime.now();
    return dateToYMD(now).substring(0, 7);
  }


  ///计算3天后日期
  static int getThreeDaysLaterTimestamp() {
    // 获取当前日期
    DateTime now = DateTime.now();
    // 计算 3 天后的日期
    DateTime threeDaysLater = DateTime(now.year, now.month, now.day + 3);
    // 将日期格式化为时间戳
    return threeDaysLater.millisecondsSinceEpoch;
  }

  static int getNowDayTimestamp() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    return today.millisecondsSinceEpoch;
  }
}
