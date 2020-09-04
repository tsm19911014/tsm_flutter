import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmListenerPgae extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmListenerState();
}

class _TsmListenerState extends State<TsmListenerPgae> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;

  double _left = 0;
  double _top = 0;

  String _tag;

  var tap = TapGestureRecognizer();


  GlobalKey key=GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Listener触摸事件'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Listener(
            onPointerDown: (event) {
              printString('onPointerDown');
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (event) {
              printString('onPointerMove :+${event.position}');
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (event) {
              printString('onPointerUp');
              setState(() {
                _event = event;
              });
            },
            child: Container(
              width: double.infinity,
              height: 150,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: Text(_event?.toString() ?? ""),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.greenAccent,
              child: Center(
                child: Text(_tag ??= '',style: TextStyle(color: Colors.black87),),
              ),
            ),
            onTap: () {
              setState(() {
                _tag = "单击";
              });
            },
            onDoubleTap: () {
              setState(() {
                _tag = "双击";
              });
            },
            onLongPress: () {
              setState(() {
                _tag = "长按";
              });
            },
          ),
          Container(
            height: 200,
            color: Colors.pink,
            child: Stack(
              children: [
                Positioned(
                  left: _left,
                  top: _top,
                  child: GestureDetector(
                    child: CircleAvatar(
                      key: key,
                      child: Text('A'),
                    ),
                    onPanUpdate: (event) {
                      setState(() {
                        _left += event.delta.dx;
                        if(_left<0){
                          _left=0;
                        }
                        var width=getAppWidth(context);
                        var wiget_width=getWidgetWidthAndHeight(key)[0];
                        if(_left>width-wiget_width){
                          _left=width-wiget_width;
                        }
                        _top += event.delta.dy;
                        if(_top<0){
                          _top=0;
                        }
                        if(_top>200-wiget_width){
                          _top=200-wiget_width;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ));
}
