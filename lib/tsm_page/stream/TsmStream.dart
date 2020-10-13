import 'dart:async';
import 'dart:math';

import 'package:flutter_app1/utils.dart';

typedef String tsmTest();


class TsmStream {


  StreamController<tsmTest> _controller;

  Stream<tsmTest> stream;

  StreamController get controller => _controller;

  StreamSink<tsmTest> get streamSink => _controller.sink;


  StreamSubscription subscription;


  first(){
    _controller = StreamController<tsmTest>();
    stream= _controller.stream;
  }


  init() {
    if(subscription==null){
      subscription = stream.listen((event) {
        printString(event());
//        event.forEach((element) {
//          printString(element);
//        });
      });
    }
    streamSink.add((){
      String a='1';
      String b='b';
      return a+b;
    });

//    controller.stream.where((event) => false).listen((event) {
//      event.forEach((element) {
//        printString(element);
//      });
//    }).

  }

  close() {
    subscription?.cancel();
    _controller?.close();
  }
}
