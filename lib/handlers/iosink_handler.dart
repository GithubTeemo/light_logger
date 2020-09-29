import 'dart:io';

import '../utils.dart';
import 'base.dart';

class IOSinkLoggerHandler extends LoggerHandler {
  final IOSink ioSink;
  final LoggerLevel level;
  final bool flushImmediately;

  IOSinkLoggerHandler(this.ioSink, {this.level, this.flushImmediately = false})
      : assert(ioSink != null),
        super(level: level);

  @override
  void resolve(LoggerLevel level, exception) {
    ioSink.write('${level.name}: ${stringify(exception)}\n');
    if (flushImmediately) {
      ioSink.flush();
    }
  }

  close() {
    ioSink?.close();
  }
}
