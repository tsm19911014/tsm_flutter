

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/paint/TsmCustomPaint.dart';

class TsmDrawPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw 学习'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: CustomPaint(
            size: Size(300,300),
            painter: TsmCustomPainter(),
          ),
        ),
      ),
    );
  }

}
