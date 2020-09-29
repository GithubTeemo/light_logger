

import 'package:light_logger/handlers/console_handler.dart';
import 'package:light_logger/logger.dart';

void main() {
  Logger.initLogger([
    ConsoleLoggerHandler(),
  ]);
  Logger.e('123');
}
