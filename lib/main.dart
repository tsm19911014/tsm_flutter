import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/TsmScaffoldPage.dart';
import 'package:flutter_app1/tsm_page/TsmAppBarPage.dart';

void main() {
  runApp(MyApp());
}
/**
 *   可以看我的简书同步再看代码
 *   https://www.jianshu.com/u/ebdcf9246d1e
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/tsm/first': (_)=>TsmScaffoldPage(),
        '/tsm/second':(_)=>TsmAppBarPage(),
      },
      home: TsmScaffoldPage(),
    );
  }
}
