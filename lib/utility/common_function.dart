import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}

Future<Map?> getDeviceInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var deviceData = Map();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    deviceData['id'] = iosDeviceInfo.identifierForVendor;
    deviceData['model'] = iosDeviceInfo.model;
    deviceData['os'] = '${iosDeviceInfo.systemName} ${iosDeviceInfo.systemVersion}';
    return deviceData; // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceData['model'] = '${androidDeviceInfo.manufacturer} ${androidDeviceInfo.model}';
    deviceData['id'] = androidDeviceInfo.androidId;
    deviceData['os'] = androidDeviceInfo.version.sdkInt.toString();
    return deviceData; // unique ID on Android
  }
}

Future<String?> getAppVersion() async {
  var packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}