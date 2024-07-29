import 'dart:io';
import '../../models/constants.dart' as Constants;
import 'package:flutter/foundation.dart' show kIsWeb;

String getUrlByPlatform() {
  if (Platform.isAndroid) {
    return Constants.ANDROID_URL;
  }

  if (Platform.isIOS) {
    return Constants.IOS_URL;
  }

  if (Platform.isWindows) {
    return Constants.ANDROID_URL;
  }

  if (kIsWeb) {
    return Constants.WEB_URL;
  }
  return Constants.ANDROID_URL;
}