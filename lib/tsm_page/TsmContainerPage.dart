



import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmContainerPage extends StatefulWidget{
  @override
  _TsmContainerState createState()=>_TsmContainerState();

}

class  _TsmContainerState extends State<TsmContainerPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(width: 200, height: 200),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.black87, width: 2),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.5,0.5),
            // 10% of the width, so there are ten blinds.
            colors: [Colors.redAccent, Colors.purpleAccent],
            // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.green,
              offset: Offset(2, 2),
            )
          ]),

//      transform: Matrix4.rotationZ(cos(60)),
      child: FlatButton(
        onPressed: () {
//          createModalBottomSheet(context);
        },
        child: Center(
          child: Text( 'This is TsmContainerPage',
              style: TextStyle(color: Colors.black, fontSize: 14.0)),
        ),
      ),
    );
  }

}
