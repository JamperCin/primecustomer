import 'dart:io';

import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  static String BASE_URL = "https://" + HOST + "/";
  static String HOST = config.getEnvironment();

  static const String LIVE_HOST = "api-v1.primeegiftcard.net";
  static const String DEMO_HOST = "api.primeegiftcard.com";
  static const String MAP_HOST = "maps.googleapis.com";

  static const String NGROK = "ce73-154-161-152-165.ngrok-free.app";
  static const String STAGING = "api-staging.primeegiftcard.net";

  static String PRIME_TERMS = "https://www.primeegiftcard.com/mobile-terms";
  static String PRIVACY_POLICY =
      "https://www.primeegiftcard.com/mobile-privacy";

  static var googleAPIKey = "AIzaSyBsnVLVZOQYt7P1IJKKZ_nAoBjlMn5wgjw";

  static String PRIME_APP_STORE_URL() {
    if (kIsWeb) {
      return "http://www.primeegiftcard.com";
    } else if (Platform.isIOS) {
      return "https://apps.apple.com/us/app/prime-e-gift/id1546084735";
    } else if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=com.jackbuild.prime.customer";
    }
    return "https://apps.apple.com/us/app/prime-e-gift/id1546084735";
  }
}
