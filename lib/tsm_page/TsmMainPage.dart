
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/stream/TsmStream.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';
import 'package:permission_handler/permission_handler.dart';

import '../tsm_page_routes.dart';
import '../tsm_stream.dart';
import 'main/TsmScaffoldPage.dart';

class TsmMainPage extends StatefulWidget {
  @override
  _TsmMainState createState() => _TsmMainState();
}

class _TsmMainState extends State<TsmMainPage> {
  List<String> list;
  ScrollController _controller;
  var _direction = Axis.vertical;
  DateTime _lastPressedAt; //上次点击时间




  @override
  void dispose() {
    _controller?.removeListener(lis);
    super.dispose();
  }

  void lis() {
    setState(() {

    });
    printString(
        'offset:${_controller.offset}     positon:${_controller.position}');
  }

  @override
  void initState() {
    super.initState();
    _controller =
        ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
    _controller.addListener(lis);
    list = [
      'Scaffold 学习',
      'AppBar学习',
      'Container 学习',
      'Row and Column',
      'Text 拼接,与富文本',
      'TextField 输入框学习',
      'RaisedButton 学习',
      'Icon  学习',
      "Image 学习",
      '改变listView方向',
      'ScrollView  集合',
      '国航航班动态练习',
      'Switch Checkbox  学习',
      'ProgressIndicator  学习',
      'Wrap  学习',
      'Inherited  学习',
      'Dialog  学习',
      'Listener触摸事件  学习',
      'Animation  学习',
      '自定义绘制  学习',
      '手势冲突  学习',
      'Stream  学习',
      'BLoC  学习',
      'RxDart  学习',
      'Icon  学习',
      'Icon  学习',
    ];
  }

  @override
  Widget build(BuildContext context) {
    /**
     * WillPopScope  用法是用来确定是否放过返回事件,
     */
    return WillPopScope(
      /**
       * async 用法  官网介绍  The analyzer produces this diagnostic when the body of a function has the async modifier even though the return type of the function isn’t assignable to Future.
       * 当函数体具有async修饰符时，即使函数的返回类型不可分配给Future，分析器也会生成此诊断。
       */
      onWillPop: () async {///双击退出
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          printString('双击退出');
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('主页 ListView 属性'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: inflateText("跳跃", Colors.white, 15),
          onPressed: () {
            _controller.animateTo(100,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
        ),
        body: Container(
          color: Colors.white,
          child: Scrollbar(
            child: ListView.separated(
              ///类似ios 月结回弹的效果,但是需要列表的长度必须沾满他的viewport
              ///也就是子布局高度的总和必须大于listview 的实际高度度
              physics: BouncingScrollPhysics(),
              controller: _controller,

              ///看到 属性介绍primary 如果为真的时候即使他没有足够的高度来实际滚动他也会滚动,
              ///但是要求 controller 为 null ,但是我哦试验了一下没有作用
//          primary: true,
              separatorBuilder: (con, index) => Divider(),
              scrollDirection: _direction,
              itemBuilder: (BuildContext, int) => Container(
                  child: FlatButton(
                    highlightColor: Colors.transparent,
                    child:  Text(
                      list[int],
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    onPressed: () {
                      _onPressedItem(context, int);
                    },
                  )),
              itemCount: list.length,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return TsmScaffoldPage();
        },settings: RouteSettings(arguments: 'value'))).then((value) => printString(value));
//        Navigator.of(context).pushNamed(page_routes_scaffold);
        break;
      case 1:
        Navigator.of(context).pushNamed(page_routes_appbar,arguments: 'test');
        break;
      case 2:
        Navigator.of(context).pushNamed(page_routes_container);
        break;
      case 3:
        Navigator.of(context).pushNamed(page_routes_row_and_column);
        break;
      case 4:
        Navigator.of(context).pushNamed(page_routes_text);
        break;
      case 5:
        Navigator.of(context).pushNamed(page_routes_text_field);
        break;
      case 6:
        Navigator.of(context).pushNamed(page_routes_raised_button);
        break;
      case 7:
        Navigator.of(context).pushNamed(page_routes_icon);
        break;
      case 8:
        [Permission.storage, Permission.camera].request()
          ..then((value) {
            if (value[Permission.storage].isGranted) {
              if (value[Permission.camera].isGranted) {
                Navigator.of(context).pushNamed(page_routes_iamge);
              }
            }
          });
        //还有一种写法是
//      var result = await Permission.storage.request();
//      if (result.isGranted) {
//        Navigator.of(context).pushNamed(page_routes_iamge);
//      }
        break;
      case 9:

        ///切换方向
        setState(() {
          if (_direction == Axis.vertical) {
            _direction = Axis.horizontal;
          } else {
            _direction = Axis.vertical;
          }
        });
        break;
      case 10:
        Navigator.of(context).pushNamed(page_routes_scroll_base);
        break;
      case 11:
        Navigator.of(context).pushNamed(page_routes_flight_dyn);
        break;
      case 12:
        Navigator.of(context).pushNamed(page_routes_check_widget);
        break;
      case 13:
        Navigator.of(context).pushNamed(page_routes_progress_indicator);
        break;
      case 14:
        Navigator.of(context).pushNamed(page_routes_wrap);
        break;
      case 15:
        Navigator.of(context).pushNamed(page_routes_inherited);
        break;
      case 16:
        Navigator.of(context).pushNamed(page_routes_dialog);
        break;
      case 17:
        Navigator.of(context).pushNamed(page_routes_listener);
        break;
      case 18:
        Navigator.of(context).pushNamed(page_routes_main_anim);
        break;
      case 19:
        Navigator.of(context).pushNamed(page_routes_draw);
        break;
      case 20:
        Navigator.of(context).pushNamed(page_routes_gesture_conflict);
        break;
      case 21 :
        Navigator.of(context).pushNamed(page_routes_stream);
        break;
      case 22:
        Navigator.of(context).pushNamed(page_routes_bloc);
        break;
      case 23:
        Navigator.of(context).push(MaterialPageRoute(builder: (con){
          return TsmStreamPage();
        }));
        break;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }




}
