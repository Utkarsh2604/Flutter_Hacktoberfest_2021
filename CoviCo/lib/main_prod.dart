import 'package:covico/start_app.dart';
import 'package:covico/util/app_config.dart';
import 'package:covico/util/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  AppConfig.init(AppFlavor.production);
  AppLogger.initLogger(false);

  FlutterError.onError = (error) {
    FlutterError.dumpErrorToConsole(error);
    Logger logger = Logger('mail');
    logger.warning('###Error####');
    logger.warning(error.stack);
  };
  startApp();
}
