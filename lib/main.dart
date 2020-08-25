import 'package:flutter/material.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/ScrollBasePage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmContainerPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmIconPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmImagePage.dart';
import 'package:flutter_app1/tsm_page/TsmMainPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmGridViewPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmListViewPage.dart';
import 'package:flutter_app1/tsm_page/tsm_flight_dyn_page.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/button/TsmRaisedButtonPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmRowAndColumnPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmScaffoldPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmAppBarPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/TsmSingleChildScrollViewPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextField.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextPage.dart';
import 'package:flutter_app1/tsm_page_routes.dart';
import 'package:flutter_app1/utils.dart';

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
    Map<String, Widget> _route = {
      page_routes_container: TsmContainerPage(),
      page_routes_scaffold: TsmScaffoldPage(),
      page_routes_appbar: TsmAppBarPage(),
      page_routes_row_and_column: TsmRowAndColumnPage(),
      page_routes_text: TsmTextPage(),
      page_routes_text_field: TsmTextFieldPage(),
      page_routes_raised_button: TsmRaisedButtonPage(),
      page_routes_icon: TsmIconPage(),
      page_routes_iamge: TsmImagePage(),
      page_routes_single_child_scroll_view: TsmSingleChildScrollViewPage(),
      page_routes_scroll_base: ScrollBasePage(),
      page_routes_grid_view: TsmGridViewPage(),
      page_routes_list_view: TsmListViewPage(),
      page_routes_flight_dyn: TsmFlightDynPage(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
//      initialRoute: page_routes_row_and_column,   ///设置了这个属性结果 home: 这个属性就失去意义了, initialRoute所指向的节点变为首页了
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      ///   经测试这个东西必须    与  routes  中的配置互斥,如果在routes 中配置了,
      ///   则该回调不起作用,可以利用map 来操作,先把map加载进来,
      ///   同样的原理,不过可以控制跳转
      onGenerateRoute: (settings) {
        printString('onGenerateRoute');
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          printString(routeName);
          if (_route.containsKey(routeName)) {
            return _route[routeName];
          }
          return TsmScaffoldPage();
        });
      },
//      routes: {
//        page_routes_container: (context) => TsmContainerPage(),
//        page_routes_scaffold: (context) => TsmScaffoldPage(),
//        page_routes_appbar: (context) => TsmAppBarPage(),
//        page_routes_row_and_column: (context) => TsmRowAndColumnPage(),
//        page_routes_text: (context) => TsmTextPage(),
//        page_routes_text_field: (context) => TsmTextFieldPage(),
//        page_routes_raised_button: (context) => TsmRaisedButtonPage(),
//        page_routes_icon: (context) => TsmIconPage(),
//        page_routes_iamge: (context) => TsmImagePage(),
//        page_routes_single_child_scroll_view: (context) =>
//            TsmSingleChildScrollViewPage(),
//        page_routes_scroll_base: (context) => ScrollBasePage(),
//        page_routes_grid_view: (context) => TsmGridViewPage(),
//        page_routes_list_view: (context) => TsmListViewPage(),
//      },
      home: TsmMainPage(),
    );
  }
}
