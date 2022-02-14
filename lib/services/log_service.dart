import 'package:logger/logger.dart';
import 'package:networking/services/http_service.dart';

class Log {
  static Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void d(String message) {
    if(Network.isTester)_logger.d(message);
  }

  static void i(String message) {
    _logger.i(message);
  }

  static void w(String message) {
    if(Network.isTester)_logger.i(message);
  }

  static void e(String message) {
    _logger.i(message);
  }
}
