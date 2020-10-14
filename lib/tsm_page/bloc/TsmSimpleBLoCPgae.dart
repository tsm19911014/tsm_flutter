




import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmSimpleBLoCPgae extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    _SimpleBLoC bloc=_SimpleBLoC.of();

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple BLoC 学习'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:bloc.outStream ,
        initialData: bloc.data,
        builder: (context,snap){
          return Container(
            alignment: Alignment.center,
            child: Text(snap.data.toString(),style: TextStyle(fontSize: 18),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: (){
          bloc.add();
        },
      ),
    );
  }
}
class _SimpleBLoC{
  int _data;
   StreamController _streamController;
  _SimpleBLoC.of(){
     _streamController=StreamController<int>();
     _data=0;
  }


  get outStream=>_streamController.stream;

  get data=>_data;

  add(){
    _streamController.sink.add(++_data);
  }

}