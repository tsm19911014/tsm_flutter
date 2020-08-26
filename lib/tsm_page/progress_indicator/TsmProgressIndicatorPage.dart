


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmProgressIndicatorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_TsmProgressIndicatorState();

}



class _TsmProgressIndicatorState extends State<TsmProgressIndicatorPage> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('ProgressIndicator'),
      centerTitle: true,
    ),

    body: Container(
      color: Colors.white,
      child: Column(
        children: [
          LinearProgressIndicator(
            value: 0.2,///进度0-1
            backgroundColor: Colors.yellowAccent,/// 背景色
            minHeight: 5,/// 高度
            valueColor:AlwaysStoppedAnimation(Colors.redAccent), // 改变颜色,这里是动画,后面讲
            semanticsLabel: 'semanticsLabel',///辅助功能内从
            semanticsValue: 'semanticsValue',///辅助功能进度
          ),
          CircularProgressIndicator(///不给value 就转圈  ,给了就固定圆圈进度
//            value:0.5,
//            valueColor: AlwaysStoppedAnimation(Colors.redAccent),
//            backgroundColor: Colors.purpleAccent,
          )
        ],
      ),
    ),
  );

}