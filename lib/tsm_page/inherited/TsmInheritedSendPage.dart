import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/inherited/TsmShareInteritedWidget.dart';

import 'TsmInheritedWidget.dart';

class TsmInheritedSendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmInheritedSendPageState();
}

class _TsmInheritedSendPageState extends State<TsmInheritedSendPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Inherited 学习'),
        ),
        body: Container(
          child: Center(
              child: TsmShareInteritedWidget(
            data: count,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TsmInheritedWidget(),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  child: Text('计数器'),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                )
              ],
            ),
          )),
        ),
      );
}
