import 'package:covico/util/app_keys.dart';

/// Add new app Flavor here
enum AppFlavor { development, production }

/// Provides configuration depending on the flavor of build.
/// Any property app configuration that differs in prod and dev should be
/// added here.
class AppConfig {
  static AppFlavor _appFlavor;

  /// Initialise the flavor of the application
  /// Make sure this function is called no more than once
  /// throughout the application.
  static void init(AppFlavor flavor) {
    assert(flavor != null);
    if (_appFlavor != null) {
      throw Error();
    }
    _appFlavor = flavor;
  }

  static AppFlavor get appFlavor => _appFlavor;

  static String get baseUrl {
    switch (_appFlavor) {
      case AppFlavor.production:
        return AppKeysProduction.BASE_URL;
      case AppFlavor.development:
      default:
        return AppKeysDevelopment.BASE_URL;
    }
  }
}
