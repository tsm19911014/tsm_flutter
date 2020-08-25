import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/TsmStateFulWidget.dart';

/**
 * 这个类主要写AppBar这个控件
 */
// ignore: must_be_immutable
class TsmAppBarPage extends StatefulWidget {

  @override
  _SecondPageSate createState() => _SecondPageSate();

}

class _SecondPageSate extends State<TsmAppBarPage> with SingleTickerProviderStateMixin{


  final List<Tab> _tabs = <Tab>[
    Tab(text: '关注'),
    Tab(text: '推按'),
    Tab(text: '视频'),
    Tab(text: '游戏'),
    Tab(text: '音乐'),
    Tab(text: '体育'),
    Tab(text: '生活'),
    Tab(text: '图片'),
  ];

  var _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }


  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context).settings.arguments;
    if(arg !=null){
      printString('arguments:'+arg);
    }

    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .padding
        .top; ////状态栏高度

    MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),///禁止字体缩放
        child: Container());
    return Scaffold(
      appBar: AppBar(
        title: Text('This is SecondPage'),
        leading: Builder(builder: (context){
          return FlatButton(
            child: Icon(Icons.access_alarms),
            onPressed: (){
              Navigator.of(context).pop();
            },
          );
        },),
        excludeHeaderSemantics:true,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
        textTheme: TextTheme(headline6: TextStyle(color: Colors.redAccent)) ,
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.redAccent, // 选中的Widget颜色
          indicatorColor:Colors.redAccent, // 选中的指示器颜色
          labelStyle:   TextStyle(fontSize: 15.0),// 必须设置，设置 color 没用的，因为 labelColor 已经设置了
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle:   TextStyle(
              fontSize: 15.0), // 设置 color 没用的，因为unselectedLabelColor已经设置了
          controller: _tabController,
          // tabbar 必须设置 controller 否则报错
          indicatorSize: TabBarIndicatorSize.label,
          // 有 tab 和 label 两种
          tabs: _tabs,
        ),
      ),
      body: TsmStateFulWidget('SecondPage', false),

    );
  }
}
