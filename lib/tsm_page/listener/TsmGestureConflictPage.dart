import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmGestureConflictPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势冲突'),
        centerTitle: true,
      ),
      body: Listener(
        onPointerDown: (event){
          printString('onPointerDown');
        },
        onPointerMove: (event){
          printString('onPointerMove');
        } ,

        onPointerUp:(event){
          printString('onPointerUp');
        }  ,
        child: GestureDetector(
          onVerticalDragUpdate: (event) {
            printString('onVerticalDragUpdate');
          },
          onVerticalDragEnd: (event) {
            printString('onVerticalDragEnd');
          },
          onHorizontalDragUpdate: (event) {
            printString('onHorizontalDragUpdate');
          },
          onHorizontalDragEnd: (event) {
            printString('onHorizontalDragEnd');
          },
          onPanDown: (event) {
            printString('onPanDown');
          },
          onTapUp: (event){
            printString('onTapUp');
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.redAccent),
        ),
      ),
    );
  }
}
