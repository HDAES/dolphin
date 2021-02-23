import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/utils/utils.dart';

class Global {

  // 版本号
  static String version;
  // 运行平台
  static String platform; 
  // 唯一ID
  static String uuid;
  // 手机型号
  static String phoneModel;

  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    //工具初始
    await StorageUtil.init();
    await PackageInfoUtil.init();
    HttpUtil();
    
    // 强制竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

  }
}