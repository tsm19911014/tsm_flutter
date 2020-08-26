import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmCheckPageState();
}

class _TsmCheckPageState extends State<TsmCheckPage> {
  var isSelectSwitch = false;
  var isSelectCheckboxIndex = 0;

  var check_1 = false;
  var check_2 = false;
  var check_3 = false;
  var check_4 = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('勾选框'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(

                  value: isSelectSwitch,

                  ///  勾选后颜色
                  activeColor: Colors.greenAccent,

                  ///  打开后进度条颜色
                  activeTrackColor: Colors.blueAccent,

                  ///  关闭后按钮颜色
                  inactiveThumbColor: Colors.redAccent,

                  ///关闭后按钮图片
                  inactiveThumbImage: AssetImage('images/sunny.png'),


                  onChanged: (isSelect) {
                    setState(() {
                      isSelectSwitch = !isSelectSwitch;
                    });
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                      value: 0 == isSelectCheckboxIndex,
                      activeColor: Colors.redAccent,
                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          isSelectCheckboxIndex = 0;
                        });
                      },
                    ),
                    Checkbox(
                      value: 1 == isSelectCheckboxIndex,
                      activeColor: Colors.blueAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          isSelectCheckboxIndex = 1;
                        });
                      },
                    ),
                    Checkbox(
                      value: 2 == isSelectCheckboxIndex,
                      activeColor: Colors.purpleAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          isSelectCheckboxIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                      value: check_1,
                      activeColor: Colors.redAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          check_1 = !check_1;
                        });
                      },
                    ),
                    Checkbox(
                      value: check_2,
                      activeColor: Colors.blueAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          check_2 = !check_2;
                        });
                      },
                    ),
                    Checkbox(
                      value: check_3,
                      activeColor: Colors.purpleAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          check_3 = !check_3;
                        });
                      },
                    ),
                    Checkbox(
                      value: check_4,
                      activeColor: Colors.yellowAccent,

                      /// 勾选后颜色
                      onChanged: (isSelect) {
                        setState(() {
                          check_4 = !check_4;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
