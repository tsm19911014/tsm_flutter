
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TsmIconPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_TsmIconPageState();
  
}

class _TsmIconPageState extends State<TsmIconPage>{
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('Icon 学习'),
    ),
    body: Container(
      color: Colors.white,
      height: double.infinity,
      constraints: BoxConstraints(maxHeight: 50),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[

//          Image(image: null,),

          /// 源码中介绍Icon 是一个方形的部件,如果设置的内容不是方形,显示可能有问题,
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            ///该字段是在 talkback等辅助功能时才会触发,测试有效,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 30.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          ),
        ],
      ),
    ),
  );
  
}



