

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

import 'TsmShareInteritedWidget.dart';

class  TsmInheritedWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_TsmInheritedWidgetState();

}


class _TsmInheritedWidgetState extends State<TsmInheritedWidget>{
  @override
  Widget build(BuildContext context) {
    printString('build');
    return Text(TsmShareInteritedWidget.ofData(context).data.toString());
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    printString('didChangeDependencies');
  }

}