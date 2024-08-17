import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import '../../models/constants.dart' as constants;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getUrlByPlatform() async {
  final deviceInfo = DeviceInfoPlugin();
  String deviceUrl;

  if (kIsWeb) {
    deviceUrl = constants.weburl;
  } else if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.isPhysicalDevice) {
      deviceUrl = constants.fisicalUrl;
    } else {
      deviceUrl = constants.androidUrl;
    }
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    if (iosInfo.isPhysicalDevice) {
      deviceUrl = constants.iosUrl;
    } else {
      deviceUrl = constants.fisicalUrl;
    }
  } else if (Platform.isWindows) {
    deviceUrl = constants.weburl;
  } else {
    deviceUrl = constants.androidUrl;
  }

  return deviceUrl;
}
