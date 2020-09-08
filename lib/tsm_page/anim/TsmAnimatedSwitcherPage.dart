



import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChangeColorButton.dart';
import 'TsmCurvedAnimation.dart';

class   TsmAnimatedSwitcherPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_TsmAnimatedSwitcherState();

}



class _TsmAnimatedSwitcherState extends  State<TsmAnimatedSwitcherPage>{



  int _count=0;

  Color endColor=null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher学习'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds:200),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child,animation){
                return SlideTransitionX(
                  position:CurvedAnimation(parent: animation,curve: Curves.ease),
                  child: child,
                  direction: AxisDirection.up,
                );
              },
              child: Text(_count.toString(),key: ValueKey(_count),),
            ),

            RaisedButton(
              child: Text('点击文字增加'),
              onPressed: (){
                setState(() {
                  _count++;
                });
              },
            ),


            ChangeColorButton(
              end: endColor,
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text('复杂动画'),
                onPressed: (){
                  setState(() {
                    endColor=Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
                  });
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}