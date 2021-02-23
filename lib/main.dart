import 'package:bot_toast/bot_toast.dart';
import 'package:dolphin/pages/index_page.dart';
import 'package:dolphin/provider/Theme.dart';
import 'package:dolphin/provider/providers.dart';
import 'package:dolphin/routers/application.dart';
import 'package:dolphin/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'global.dart';

void main() async{
  await Global.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    //创建
    final router = new FluroRouter();
    //绑定
    Routes.configRoutes(router);
    //全局赋值
    Application.router = router;

    
    return MultiProvider(
      providers: providers,
      child:Consumer<ThemeProvider>(
        builder: (context, themeModel, child) {
          return ScreenUtilInit(
            designSize: Size(750, 1334),
            allowFontScaling: false,
            builder: () =>MaterialApp(
              title: '小海豚',
              onGenerateRoute: Application.router.generator,
              theme: themeModel.themeData(),
              builder: (context, child) => Scaffold(
                resizeToAvoidBottomPadding: false,
                body:GestureDetector(
                  onTap: (){
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus.unfocus();
                    }
                  },
                  child: botToastBuilder(context,child),
                )
              ),
              navigatorObservers: [BotToastNavigatorObserver()],
              home: IndexPageWidget(),
            ),
          );
        }
      )
    );
  }
}