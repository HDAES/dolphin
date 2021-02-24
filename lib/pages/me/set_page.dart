
import 'package:flutter/material.dart';

class SetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.transparent,
        title: Text("SETTINGS",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color
          ),
        ),
      ),
    );
  }
}