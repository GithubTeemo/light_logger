library light_logger;

import 'handlers/base.dart';

class Logger {
  Logger._();

  static List<LoggerHandler> sHandlers;

  static void initLogger(List<LoggerHandler> handlers) {
    sHandlers = handlers;
  }

  static void i(dynamic exception) {
    _log(LoggerLevel.INFO, exception);
  }

  static void d(dynamic exception) {
    _log(LoggerLevel.DEBUG, exception);
  }

  static void e(dynamic exception) {
    _log(LoggerLevel.ERROR, exception);
  }

  static void v(dynamic exception) {
    _log(LoggerLevel.VERBOSE, exception);
  }

  static void w(dynamic exception) {
    _log(LoggerLevel.WARNING, exception);
  }

  static void a(dynamic exception) {
    _log(LoggerLevel.ASSERT, exception);
  }

  static void _log(LoggerLevel level, dynamic exception) {
    sHandlers.forEach((handler) {
      if (handler.shouldLog(level)) {
        handler.resolve(level, exception);
      }
    });
  }
}
