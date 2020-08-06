import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/TsmStateFulWidget.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageSate createState() => _SecondPageSate();
}

class _SecondPageSate extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: TsmStateFulWidget('SecondPage', false),
    );
  }
}
