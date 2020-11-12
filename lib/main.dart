import 'package:flutter/material.dart';
import 'package:flutter_app1/TsmNavigator.dart';
import 'package:flutter_app1/tsm_page/TsmMainPage.dart';
import 'package:flutter_app1/tsm_page/anim/TsmAnimMainPage.dart';
import 'package:flutter_app1/tsm_page/anim/TsmAnimatedBuilderPage.dart';
import 'package:flutter_app1/tsm_page/anim/TsmAnimatedSwitcherPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/anim/TsmPageRoute.dart';
import 'package:flutter_app1/tsm_page/anim/TsmAnimationPage.dart';
import 'package:flutter_app1/tsm_page/anim/TsmStaggerAnimationPage.dart';
import 'package:flutter_app1/tsm_page/bloc/TsmBLoCMainPage.dart';
import 'package:flutter_app1/tsm_page/bloc/TsmSimpleBLoCPgae.dart';
import 'package:flutter_app1/tsm_page/bloc/flutterbolc/TsmFlutterBLoCPage.dart';
import 'package:flutter_app1/tsm_page/bloc/form_validation/tsm_form_validation.dart';
import 'package:flutter_app1/tsm_page/check/TsmCheckPage.dart';
import 'package:flutter_app1/tsm_page/dialog/TsmDialogPage.dart';
import 'package:flutter_app1/tsm_page/dio/TsmDioPage.dart';
import 'package:flutter_app1/tsm_page/inherited/TsmInheritedSendPage.dart';
import 'package:flutter_app1/tsm_page/listener/TsmGestureConflictPage.dart';
import 'package:flutter_app1/tsm_page/listener/TsmListenerPage.dart';
import 'package:flutter_app1/tsm_page/paint/TsmDrawPage.dart';
import 'package:flutter_app1/tsm_page/progress_indicator/TsmProgressIndicatorPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmCustomLIstView.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmGridViewPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmListViewCheckPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmListViewPage.dart';
import 'package:flutter_app1/tsm_page/scroll/TsmStickHeaderPage.dart';
import 'package:flutter_app1/tsm_page/stream/TsmStreamPage.dart';
import 'package:flutter_app1/tsm_page/tsm_flight_dyn_page.dart';
import 'package:flutter_app1/tsm_page/wrap/TsmWrapPage.dart';
import 'package:flutter_app1/tsm_page_routes.dart';
import 'package:flutter_app1/utils.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/button/TsmRaisedButtonPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmIconPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/image/TsmImagePage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmContainerPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/layout/TsmRowAndColumnPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmAppBarPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/main/TsmScaffoldPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/ScrollBasePage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/scroll/TsmSingleChildScrollViewPage.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextField.dart';
import 'file:///D:/User/flutter_app1/lib/tsm_page/text/TsmTextPage.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() {
  runApp(MyApp());
  closeStatusBarShadow();
}
/**
 *   可以看我的简书同步再看代码
 *   https://www.jianshu.com/u/ebdcf9246d1e
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(TsmNavigator.getInstance().isFlutterBoost){
      return getFlutterBoostApp(context);
    }
    return getNormalApp(context);
  }






  Widget getNormalApp(BuildContext context){
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
      page_routes_check_widget: TsmCheckPage(),
      page_routes_progress_indicator: TsmProgressIndicatorPage(),
      page_routes_wrap: TsmWarpPage(),
      page_routes_custom_scroll_view: TsmCustomScrollViewPage(),
      page_routes_inherited: TsmInheritedSendPage(),
      page_routes_dialog: TsmDialogPage(),
      page_routes_listener: TsmListenerPgae(),
      page_routes_anim: TsmAnimationPage(),
      page_routes_main_anim: TsmAnimMainPage(),
      page_routes_stagger_route:StaggerRoute(),
      page_routes_animated_switcher:TsmAnimatedSwitcherPage(),
      page_routes_draw:TsmDrawPage(),
      page_routes_gesture_conflict:TsmGestureConflictPage(),
      page_routes_animated_builder:TsmAnimatedBuilderPage(),
      page_routes_stream:TsmStreamPage(),
      page_routes_bloc:TsmBLoCMainPage(),
      page_routes_bloc_simple:TsmSimpleBLoCPage(),
      page_routes_flutter_bloc_count:TsmFlutterBLoCPageBase(),
      page_routes_flutter_bloc_form:TsmFormValidation(),
      page_routes_dio_test:TsmDioPage(),
      page_routes_list_check:TsmListViewCheckPage(),
      page_routes_stick_header:TsmStickHeaderPage(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
//      initialRoute: page_routes_row_and_column,   ///设置了这个属性结果 home: 这个属性就失去意义了, initialRoute所指向的节点变为首页了
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ///  这里可以修改全局appbar 字体颜色
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      ///   经测试  onGenerateRoute 必须    与  routes  中的配置互斥,如果在routes 中配置了,
      ///   则该回调不起作用,可以利用map 来操作,先把map加载进来,
      ///   同样的原理,不过可以控制跳转
      onGenerateRoute: (settings) {
        String routeName = settings.name;
        printString(routeName);

        ///实际项目中如果页面需要强制登录的话,这个子页面写很麻烦,
        ///可以在这里统一处理一下
        /// 比如
        ///
        ///          if (routeName.contains('login')) {
        ///            if(!UserManager.isUserLogin()){
        ///              return LoginWidget();
        ///            }
        ///          }
        /// 这里只是打个比方,如果在登录后还需要把目的页打开,只要给LoginWidget
        /// 增加一个非必要入参route 登录完成后判断一下,费空的话直接打开就好了,
        ///
        return TsmRoute(builder: (context) {
          if (_route.containsKey(routeName)) {
            return _route[routeName];
          }
          return TsmScaffoldPage();
        });
      },
      home: TsmMainPage(),
    );
  }










  Widget getFlutterBoostApp(BuildContext context){
    FlutterBoost.singleton.registerPageBuilders({
      page_routes_container:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmContainerPage(),
      page_routes_container:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmContainerPage(),
      page_routes_scaffold:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmScaffoldPage(),
      page_routes_appbar:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmAppBarPage(),
      page_routes_row_and_column:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmRowAndColumnPage(),
      page_routes_text:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmTextPage(),
      page_routes_text_field:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmTextFieldPage(),
      page_routes_raised_button:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmRaisedButtonPage(),
      page_routes_icon:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmIconPage(),
      page_routes_iamge:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmImagePage(),
      page_routes_single_child_scroll_view:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmSingleChildScrollViewPage(),
      page_routes_scroll_base:
          (String pageName, Map<String, dynamic> params, String _) =>
          ScrollBasePage(),
      page_routes_grid_view:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmGridViewPage(),
      page_routes_list_view:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmListViewPage(),
      page_routes_flight_dyn:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmFlightDynPage(),
      page_routes_check_widget:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmCheckPage(),
      page_routes_progress_indicator:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmProgressIndicatorPage(),
      page_routes_wrap:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmWarpPage(),
      page_routes_custom_scroll_view:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmCustomScrollViewPage(),
      page_routes_inherited:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmInheritedSendPage(),
      page_routes_dialog:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmDialogPage(),
      page_routes_listener:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmListenerPgae(),
      page_routes_anim:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmAnimationPage(),
      page_routes_main_anim:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmAnimMainPage(),
      page_routes_stagger_route:
          (String pageName, Map<String, dynamic> params, String _) =>
          StaggerRoute(),
      page_routes_animated_switcher:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmAnimatedSwitcherPage(),
      page_routes_draw:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmDrawPage(),
      page_routes_gesture_conflict:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmGestureConflictPage(),
      page_routes_animated_builder:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmAnimatedBuilderPage(),
      page_routes_stream:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmStreamPage(),
      page_routes_bloc:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmBLoCMainPage(),
      page_routes_bloc_simple:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmSimpleBLoCPage(),
      page_routes_flutter_bloc_count:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmFlutterBLoCPageBase(),
      page_routes_flutter_bloc_form:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmFormValidation(),
      page_routes_dio_test:
          (String pageName, Map<String, dynamic> params, String _) =>
          TsmDioPage(),
      'main': (String pageName, Map<String, dynamic> params, String _) =>
          TsmMainPage(),
      page_routes_list_check: (String pageName, Map<String, dynamic> params, String _) =>TsmListViewCheckPage(),

    });
    FlutterBoost.singleton
        .addBoostNavigatorObserver(TestBoostNavigatorObserver());


    return MaterialApp(
      title: 'Flutter Demo',
//      initialRoute: page_routes_row_and_column,   ///设置了这个属性结果 home: 这个属性就失去意义了, initialRoute所指向的节点变为首页了
      theme: ThemeData(
        primarySwatch: Colors.blue,

        ///  这里可以修改全局appbar 字体颜色
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      ///   经测试  onGenerateRoute 必须    与  routes  中的配置互斥,如果在routes 中配置了,
      ///   则该回调不起作用,可以利用map 来操作,先把map加载进来,
      ///   同样的原理,不过可以控制跳转
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: TsmMainPage(),
    );
  }


  void _onRoutePushed(
      String pageName,
      String uniqueId,
      Map<String, dynamic> params,
      Route<dynamic> route,
      Future<dynamic> _,
      ) {

  }
}


class TestBoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    printString('flutterboost#didPush');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    printString('flutterboost#didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    printString('flutterboost#didRemove');
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    printString('flutterboost#didReplace');
  }
}
