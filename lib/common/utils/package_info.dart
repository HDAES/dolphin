

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dolphin/global.dart';
import 'package:package_info/package_info.dart';

class PackageInfoUtil{
  static PackageInfo packageInfo;
  static AndroidDeviceInfo androidInfo;
  static IosDeviceInfo iosInfo;


  static Future<void> init() async {
    if (packageInfo == null) {
      packageInfo = await PackageInfo.fromPlatform();
      Global.version = packageInfo.version;
    }

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    
    
    if(Platform.isAndroid){
      Global.platform = 'android';
      //android相关代码
     androidInfo = await deviceInfo.androidInfo;

      Global.phoneModel = androidInfo.model;
      Global.uuid = androidInfo.androidId;

      print('Running on ${androidInfo.model}');
      print('Running on ${androidInfo.androidId}');
      print('Running on ${androidInfo.device}');
    }else if(Platform.isIOS){
      Global.platform = 'ios';
      iosInfo = await deviceInfo.iosInfo;

      Global.phoneModel = iosInfo.name;
      Global.uuid = iosInfo.identifierForVendor;

      print('Running on ${iosInfo.utsname.machine}'); 
      print('Running on ${iosInfo.systemVersion}');
    }
  }
}