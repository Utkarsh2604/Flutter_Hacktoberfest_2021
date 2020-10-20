import 'package:logging/logging.dart';

class AppLogger {
  /// Initialise the logger
  ///
  /// [shouldLog] will set the log level to[Level.ALL] or [Level.OFF]
  /// depending on the value.
  static void initLogger(bool shouldLog) {
    Logger.root.level = shouldLog == true ? Level.ALL : Level.OFF;
    Logger.root.onRecord.listen(_printMessage);
  }

  /// Print the log message in the format:
  /// LogLevel/LoggerName: Message
  static void _printMessage(LogRecord record) {
    print("${record.level.name}/${record.loggerName}: ${record.message}");
  }
}
