import 'package:flutter/services.dart';

///调用原生方法入口
class Shell {
  static const platform = MethodChannel('com.hdsk.safety/shell');

  ///禁止截屏
  Future<int> prohibitScreenshots() async {
    try {
      return await platform.invokeMethod('prohibitScreenshots');
    } on PlatformException {
      return 0;
    }
  }
}
