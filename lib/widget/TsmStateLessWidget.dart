import 'package:flutter/material.dart';

class TsmStateLessWidget extends StatelessWidget {
  /// 这种引用设置为final  不可修改的类型,如果不设置,会有提醒
  final String content;

  TsmStateLessWidget(this.content);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Text(content ?? 'This is Simple Text',
              style: TextStyle(color: Colors.black, fontSize: 14.0)),
        ),
        color: Colors.white);
  }
}







