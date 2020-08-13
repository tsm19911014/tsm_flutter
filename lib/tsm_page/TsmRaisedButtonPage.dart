import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmRaisedButtonPage extends StatefulWidget {
  @override
  _TsmRaisedButtonState createState() => _TsmRaisedButtonState();
}

class _TsmRaisedButtonState extends State<TsmRaisedButtonPage> {
  var enable = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('RaisedButton  学习'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              /**
               * RaisedButton  用来用去也就是状态不一样背景色和字体颜色不一样,
               */
              RaisedButton(
                onPressed: () {
                  setState(() {
                    enable = !enable;
                  });
                },
                child: Text("按下颜色和水波纹同时设置的时候貌似有冲突"),

                ///字体颜色
                textColor: Colors.pink,

                ///背景颜色
                color: Colors.orange,
//                highlightColor: Color(0xff00ff00),///按下时背景颜色
                ///水波纹颜色
                splashColor: Colors.yellowAccent,

                ///阴影z轴的高度
                elevation: 3,
              ),

              /**
               * https://api.flutter.dev/flutter/material/RaisedButton-class.html
               * 上面这个链接就是介绍RaisedButton 这个按钮如果没有设置  onPressed  或者 没有设置 noLongPressed 就是disable 状态这里演示一下
               */
              RaisedButton(
                child: Text("disabled状态下颜色设置"),
                onPressed: enable
                    ? () {
                        printString("正常状态");
                      }
                    : null,

                ///字体颜色
                textColor: Colors.purpleAccent,

                ///水波纹颜色
                splashColor: Colors.blueAccent,

                ///背景颜色
                color: Colors.orange,

                ///不可点击的文本颜色
                disabledTextColor: Colors.greenAccent,

                ///不可点击的背景颜色
                disabledColor: Colors.redAccent,

                ///阴影  z轴高度
                elevation: 3,
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Gradient Button',
                      style: TextStyle(fontSize: 20)),
                ),
              ),

              /**
               * 多了一个图片,方便使用
               */
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  textColor: Colors.pink,
                  color: Colors.orange,
//                highlightColor: Color(0xff00ff00),
                  splashColor: Colors.yellowAccent,
                  elevation: 3,
                  label: Text('牛x了伙计')),
            ],
          ),
        ),
      );
}
