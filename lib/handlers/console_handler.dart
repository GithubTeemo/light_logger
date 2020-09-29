import 'dart:io';

import 'base.dart';

import '../utils.dart';

class ConsoleLoggerHandler extends LoggerHandler {
  ConsoleLoggerHandler({LoggerLevel level}) : super(level: level);

  @override
  void resolve(LoggerLevel level, exception) {
    final String msg = stringify(exception);
    stdout.writeln("${level.name}: $msg");
  }

  @override
  bool shouldLog(LoggerLevel level) {
    return level.index >= this.level.index;
  }
}
