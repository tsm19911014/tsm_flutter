




import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/bloc/TsmBaseBLoC.dart';

import '../../main.dart';

class TsmSimpleBLoCPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TsmBaseBLoCWidget<_SimpleBLoC>(
      bloc: _SimpleBLoC.of(),
      child: TsmBaseBLoCTest(),
    );
  }

}
class TsmBaseBLoCTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    _SimpleBLoC _bloc=TsmBaseBLoCWidget.of<_SimpleBLoC>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple BLoC 学习'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:_bloc.outStream ,
        initialData: _bloc.data,
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
          _bloc.add();
        },
      ),
    );
  }
}
class _SimpleBLoC extends TsmBaseBLoC{
  int _data;
   StreamController _streamController;
  _SimpleBLoC.of(){
     _streamController=StreamController<int>();
     _data=0;
  }

  dispose(){
    _streamController.close();
  }
  get outStream=>_streamController.stream;

  get data=>_data;

  add(){
    _streamController.sink.add(++_data);
  }
}