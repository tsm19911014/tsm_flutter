import 'dart:async';
import 'dart:math';

import 'package:flutter_app1/utils.dart';

class TsmStream {
  StreamController<List<String>> _controller = StreamController<List<String>>();

  StreamController get controller => _controller;

  StreamSink<List<String>> get streamSink => _controller.sink;

  Stream<List<String>> get stream => _controller.stream;

  StreamSubscription subscription;

  init() {
    if(subscription==null){
      subscription = stream.listen((event) {
        event.forEach((element) {
          printString(element);
        });
      });
    }
    streamSink.add(['111', '222', '333']);
    printString("init");
  }

  close() {
    subscription?.cancel();
    _controller?.close();
  }
}
