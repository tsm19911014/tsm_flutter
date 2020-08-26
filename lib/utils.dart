import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///受到保护的方法
void printString(dynamic string){
  if(string!=null){
    print('msg =${string?.toString()}');
  }
}


String checkEmptyString(String string)=>string??="";

/// 获取状态栏高度
getStatueBarHeight()=> MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

///获取屏幕高
getAppHeight(BuildContext context)=> MediaQuery.of(context).size.height;

///获取屏幕宽
getAppWidget(BuildContext context)=> MediaQuery.of(context).size.width;


///通过 key 获取 widget 宽高
List<double> getWidgetWidthAndHeight(GlobalKey  globalKey){
  double widght_widget = globalKey?.currentContext?.size?.width??0;
  double widght_height = globalKey?.currentContext?.size?.height??0;
  return[ widght_widget,widght_height];
}



closeStatusBarShadow(){
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}