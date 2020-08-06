import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';
import 'package:flutter_app1/widget/TsmStateFulWidget.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  int _currentIndex=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is FirstPage'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.title),
            tooltip: '按钮',
            onPressed: (){
              printString('点击按钮');
            },
          ),
          PopupMenuButton(
              itemBuilder:(context) => <PopupMenuItem<String>>[
                inflatePopuMenuItem(Icons.message, '发起群聊', 'A'),
                inflatePopuMenuItem(Icons.group_add, '添加服务', 'B'),
                inflatePopuMenuItem(Icons.cast_connected, '扫一扫码', 'C'),
              ],
            offset: Offset(0, 50),
          )

        ],
      ),
      backgroundColor: Colors.white,
      //侧边栏 抽屉组件
      drawer: Drawer(
          child: Center(
            child: Container(
              width: 150.0,
              color: Colors.orange,
              child: Text('抽屉栏',style: TextStyle(color: Colors.black87,fontSize: 16),),
//              child: inflateText('抽屉栏', Colors.black, 16),
            ),
          )
      ),
      body: TsmStateFulWidget('Flutter Demo Home Page', true),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex:_currentIndex,

//        fixedColor: Colors.redAccent,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: [
          inflateBottomNavBarItem(Icons.hearing, '自由'),
          inflateBottomNavBarItem(Icons.settings, '健康'),
          inflateBottomNavBarItem(Icons.message, '财富'),
          inflateBottomNavBarItem(Icons.access_alarm, '爱情'),
        ],
        onTap: (int index){
          setState(() {
            printString(index);
            _currentIndex=index;
          });
        },
      ) ,
    );
  }
}

