
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  String themeMode = 'light';

  static const themeFontFamily = 'default';

  static Color primaryColor = Color(0xFF29ABE2);

  changeThemeMode(){
    themeMode = themeMode == 'dark'?'light':'dark';
    notifyListeners();
  }

  changePrimaryColor(){
    primaryColor = Colors.orange;
    notifyListeners();
  }


  themeData(){
    ThemeData themeData = ThemeData(
      brightness: themeMode=="dark"?Brightness.dark:Brightness.light,
      iconTheme: IconThemeData(
        color: primaryColor
      ),
      appBarTheme: AppBarTheme(
        color:themeMode=="dark"?Colors.black.withOpacity(0.6):primaryColor, 
      )
    );

    return themeData;
  }
}