import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:rxdart/rxdart.dart';

class TsmStreamPage  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    testList();
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart 学习'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('测试'),
        ),
      ),
    );
  }
}


void  testList() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7];
//  Stream<int> stream=Stream.fromIterable(array).asBroadcastStream();
//  stream.map((event) {
//    printString(event);
//    return event*event;
//  });
//  stream.interval(Duration(seconds: 1)).listen((event) {
//    printString('listen1:$event');
//  });
//  stream.listen((event) { printString('listen2:$event');});

  ReplaySubject<int> publishSubject=ReplaySubject<int>();
  publishSubject.add(1);
  publishSubject.add(2);
  publishSubject.add(3);
  publishSubject.interval(Duration(seconds: 1)).listen((value) {
    printString('listen1:$value');
  });
  publishSubject.add(4);
  publishSubject.listen((value) {
    printString('listen2:$value');
  });
  publishSubject.add(5);
  publishSubject.add(6);
  publishSubject.add(7);
}

