import 'package:dolphin/provider/Theme.dart';
import 'package:dolphin/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  
  @override
  void initState() {
    print('初始化${this.widget.toStringShort()}');
    super.initState();
  }


  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){ context.read<ThemeProvider>().changeThemeMode();},
            title: Text('修改模式'),
          ),
          ListTile(
            onTap: (){ context.read<ThemeProvider>().changePrimaryColor();},
            title: Text('改变主题颜色'),
          ),
          ListTile(
            onTap: (){ Routes.navigateTo(context, Routes.demo);},
            title: Text('跳转页面'),
          )
        ],
      ),
    );
  }
}