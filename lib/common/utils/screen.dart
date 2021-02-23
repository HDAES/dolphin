
import 'package:flutter_screenutil/flutter_screenutil.dart';

//设置宽度
double setWidth(double width){
  return ScreenUtil().setWidth(width);
}

//设置高度
double setHeigh(double height){
  return ScreenUtil().setHeight(height);
}

///设置字体尺寸
double setFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}

// 获取状态栏高度
double getStatusBarHeight(){
  return ScreenUtil().statusBarHeight;
}

double getWidth(){
  return ScreenUtil().screenWidth;
}

double getHeight(){
  return ScreenUtil().screenHeight;
}
