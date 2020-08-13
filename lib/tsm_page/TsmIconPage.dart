
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmIconPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_TsmIconPageState();
  
}

class _TsmIconPageState extends State<TsmIconPage>{
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('Icon 学习'),
    ),
    body: Container(
      color: Colors.white,
      height: double.infinity,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 30.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          ),
        ],
      ),
    ),
  );
  
}



