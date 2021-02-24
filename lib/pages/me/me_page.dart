import 'package:dolphin/pages/me/set_page.dart';
import 'package:dolphin/provider/Theme.dart';
import 'package:dolphin/routers/routes.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  
   final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();   
  @override
  void initState() {
    print('初始化${this.widget.toStringShort()}');
    super.initState();
  }

  void _toggle()
    {
       _innerDrawerKey.currentState.toggle(                       
        direction: InnerDrawerDirection.end 
       );
    }

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InnerDrawer(
            key: _innerDrawerKey,
            boxShadow: [],
            onTapClose: true, // default false
            swipe: true, // default true 
            //When setting the vertical offset, be sure to use only top or bottom
            offset: IDOffset.only(bottom: 0.05, right: 0.5, left: 0.5),
            
            scale: IDOffset.horizontal( 0.8 ), // set the offset in both directions
            borderRadius: 50,  
             backgroundDecoration: BoxDecoration(color: Colors.transparent ),          
            rightChild: SetPage(), // required if rightChild is not set
            leftChild: Scaffold(), // required if leftChild is not set
            scaffold: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: ()=>context.read<ThemeProvider>().changeThemeMode(),
                    icon: Icon(
                      context.watch<ThemeProvider>().themeMode=='light'?
                      Icons.circle:Icons.bedtime),
                  ),
                  IconButton(
                    onPressed: (){_toggle();},
                    icon: Icon(Icons.settings),
                  )
                ],
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
                    onTap: (){ context.read<ThemeProvider>().changePrimaryColor();},
                    title: Text('改变字体大小'),
                  ),
                  ListTile(
                    onTap: (){ Routes.navigateTo(context, Routes.demo);},
                    title: Text('跳转页面'),
                  )
                ],
              ),
            )
        );

  }
}