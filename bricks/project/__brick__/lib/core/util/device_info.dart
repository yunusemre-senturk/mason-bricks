// Dart imports:
import 'dart:io';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';

extension DeviceInfoPluginEx on DeviceInfoPlugin {
  Future<String?> uniqueId() async {
    String? deviceId;
    if (Platform.isIOS) {
      var iosInfo = await this.iosInfo;
      if (iosInfo.isPhysicalDevice) {
        deviceId = iosInfo.identifierForVendor;
      } else {
        deviceId = "simulator";
      }
    } else if (Platform.isAndroid) {
      var androidInfo = await this.androidInfo;
      if (androidInfo.isPhysicalDevice == false) {
        deviceId = "simulator";
      } else {
        deviceId = await FirebaseInstallations.instance.getId();
      }
    }
    if (deviceId == null) {
      throw Exception("Device Id Exception");
    }
    // if (kDebugMode) {
    //   deviceId = "simulator";
    // }
    return deviceId;
  }
}
