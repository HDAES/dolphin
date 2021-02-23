import 'package:dolphin/pages/me/demo.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//首页
Handler demoHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return DemoPage();
  }
);