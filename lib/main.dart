import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/TsmContainerPage.dart';
import 'package:flutter_app1/tsm_page/TsmMainPage.dart';
import 'package:flutter_app1/tsm_page/TsmRowAndColumnPage.dart';
import 'package:flutter_app1/tsm_page/TsmScaffoldPage.dart';
import 'package:flutter_app1/tsm_page/TsmAppBarPage.dart';
import 'package:flutter_app1/tsm_page/TsmTextPage.dart';
import 'package:flutter_app1/tsm_page_routes.dart';

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
        page_routes_container:(context) =>TsmContainerPage(),
        page_routes_scaffold: (context)=>TsmScaffoldPage(),
        page_routes_appbar:(context)=>TsmAppBarPage(),
        page_routes_row_and_column:(context)=> TsmRowAndColumnPage(),
        page_routes_text:(context)=>TsmTextPage(),
      },
      home: TsmMainPage(),
    );
  }
}
