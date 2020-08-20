import 'package:flutter/material.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/ScrollBasePage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmContainerPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmIconPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmImagePage.dart';
import 'package:flutter_app1/tsm_page/TsmMainPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmGridViewPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmListViewPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/button/TsmRaisedButtonPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmRowAndColumnPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmScaffoldPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmAppBarPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/TsmSingleChildScrollViewPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextField.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextPage.dart';
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
        page_routes_text_field:(context)=>TsmTextFieldPage(),
        page_routes_raised_button:(context)=>TsmRaisedButtonPage(),
        page_routes_icon:(context)=>TsmIconPage(),
        page_routes_iamge:(context)=>TsmImagePage(),
        page_routes_single_child_scroll_view:(context)=>TsmSingleChildScrollViewPage(),
        page_routes_scroll_base:(context)=>ScrollBasePage(),
        page_routes_grid_view:(context)=>TsmGridViewPage(),
        page_routes_list_view:(context)=>TsmListViewPage(),
      },
      home: TsmMainPage(),
    );
  }
}
