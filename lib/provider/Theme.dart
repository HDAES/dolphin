import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  String themeMode = 'light';

  static const themeFontFamily = 'default';

  static Color primaryColor = Color(0xFF29ABE2);

  double fontSize = 18;

  changeThemeMode(){
    themeMode = themeMode == 'dark'?'light':'dark';
    notifyListeners();
  }

  //改变主题颜色
  changePrimaryColor(){
    primaryColor = Colors.orange;
    notifyListeners();
  }

  changeFontSize(){
    
    notifyListeners();
  }

  themeData(){
    ThemeData themeData = ThemeData(
      brightness: themeMode=="dark"?Brightness.dark:Brightness.light,
      iconTheme: IconThemeData(
        color: primaryColor
      ),
      appBarTheme: AppBarTheme(
        brightness: themeMode=="dark"?Brightness.dark:Brightness.light,
        elevation: 0,
        color:themeMode=="dark"?Colors.grey[800]:Colors.white, 
        actionsIconTheme: IconThemeData(
          color: primaryColor
        ),
        
      ),
    );
    return themeData;
  }
}