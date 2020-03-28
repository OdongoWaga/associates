import 'package:logger/logger.dart';

class Log {
  static final logger = Logger(
    printer: PrettyPrinter(colors: true),
  );

  static void d(message) {
    return logger.d(message);
  }

  static void e(message) {
    return logger.e(message);
  }

  static void i(message) {
    return logger.i(message);
  }

  static void w(message) {
    return logger.w(message);
  }
}
