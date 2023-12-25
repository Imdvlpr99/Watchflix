import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Utils {
  static Logger getLogger() {
    return Logger(
      printer: PrettyPrinter(),
    );
  }

  static String formatDateString(String source, String inputFormat, String outputFormat) {
    DateTime dateTime = DateFormat(inputFormat).parse(source);
    return DateFormat(outputFormat).format(dateTime);
  }
}