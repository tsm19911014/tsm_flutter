import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmContainerPage extends StatefulWidget {
  @override
  _TsmContainerState createState() => _TsmContainerState();
}

class _TsmContainerState extends State<TsmContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Container(
//        constraints: BoxConstraints.expand(width: 200, height: 200),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.redAccent,/// 背景色  如果这里设置了color 外部就不能设置,否则报错
            borderRadius: BorderRadius.all(Radius.circular(6)),/// 圆角
            border: Border.all(color: Colors.black87, width: 2),///边框线 的颜色与宽度
            gradient: LinearGradient(///渐变色  这里使用的是线性渐变
              begin: Alignment.topLeft,
              end: Alignment(0.5, 0.5),
              // 10% of the width, so there are ten blinds.
              colors: [Colors.redAccent, Colors.purpleAccent],
              // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
            boxShadow: <BoxShadow>[///阴影颜色
              BoxShadow(
                color: Colors.green,
                offset: Offset(2, 2),
              )
            ]),

//        transform: Matrix4.rotationZ(cos(30)),/// 旋转
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          transform: Matrix4.rotationZ(cos(60)),
          child: FlatButton(
            onPressed: () {
//          createModalBottomSheet(context);
            },
            child: Center(
              child: Text('This is TsmContainerPage',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ),
          ),
        ),
      ),
    );
  }
}
