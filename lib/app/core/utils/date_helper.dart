import 'package:intl/intl.dart';

class DateHelper {
  /// example:
  /// convert string '2022-04-20T09:00:00.935Z' to 'Rabu, 20 Apr 2022'
  static String strDateToStrDate(String date) {
    var result = DateTime.parse(date).toLocal();
    return DateFormat("EEEE, dd MMM yyyy").format(result);
  }
}
