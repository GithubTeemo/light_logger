abstract class LoggerHandler {
  LoggerLevel level;

  LoggerHandler({this.level = LoggerLevel.DEBUG});

  /// Specific resolve function.
  /// [LoggerLevel] is log level.
  void resolve(LoggerLevel level, dynamic exception);

  ///  Check if the log should printed.
  bool shouldLog(LoggerLevel level) => level.index >= this.level.index;
}

enum LoggerLevel { VERBOSE, DEBUG, INFO, WARNING, ERROR, ASSERT }

extension LoggerLevelEnumExtension on LoggerLevel {
  get name => describeEnum(this);
}

String describeEnum(Object enumEntry) {
  final String description = enumEntry.toString();
  final int indexOfDot = description.indexOf('.');
  assert(indexOfDot != -1 && indexOfDot < description.length - 1);
  return description.substring(indexOfDot + 1);
}
