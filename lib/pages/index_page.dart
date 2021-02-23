
import 'package:dolphin/common/widgets/fluid_nav_bar/fluid_nav_bar.dart';
import 'package:dolphin/pages/home/home_page.dart';
import 'package:dolphin/pages/me/me_page.dart';
import 'package:dolphin/pages/zz/list_page.dart';
import 'package:flutter/material.dart';


class IndexPageWidget extends StatefulWidget {
  @override
  _IndexPageWidgetState createState() => _IndexPageWidgetState();
}

class _IndexPageWidgetState extends State<IndexPageWidget> {
  int xx = 2;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: xx,
        children: [
          ListPage(),
          HomePage(),
          MePage()
        ],
      ),
      bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange,selectedIndex: xx)
    );
  }

  void _handleNavigationChange(int selectedIndex) {
    setState(() {
        xx = selectedIndex;
      }
    );
  }
}