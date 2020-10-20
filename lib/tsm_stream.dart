import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:rxdart/rxdart.dart';

class TsmStreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    test();
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

//   test_async([2, 15,42,53,64,73,77,99]).interval(Duration(seconds: 1)).listen((event) {printString('listen1:$event');});

test() {

//  test_async_1().listen((event) {printString('listen2:$event');});

  test_sync([4,7,12,15,22]).forEach((element) {printString(element);});
}


Stream<int> test_async(List<int> array) async*{
  for(int i=0;i<array.length;i++){
    yield array[i];
  }
}

Stream<int> test_async_1() async*{
  yield* test_async([2, 15,42,53,64,73,77,99]).map((event) => event*event);
}




Iterable<int> test_sync_1() sync*{
  yield* test_sync([4,7,12,15,22]).map((e){
    printString(e);
    return e*e;
  });

}


Iterable<int> test_sync(List<int> array) sync* {
  for (int i = 0; i < array.length; i++) {
    yield array[i];
  }
}


Future<int> test_async_future() async {
  int  future =await Future.delayed(Duration(seconds: 2),()=>1);
  printString(future);
  return future;
}


void test_rxdart() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7];
  Iterable<int> test(List<int> array) sync* {
    for (int i = 0; i < array.length; i++) {
      yield array[i];
    }
  }

  Stream<int> stream = Stream.fromIterable(test(array)).asBroadcastStream();
  stream.map((event) {
    printString(event);
    return event * event;
  });
  stream.interval(Duration(seconds: 1)).listen((event) {
    printString('listen1:$event');
  });
  stream.listen((event) {
    printString('listen2:$event');
  });

//  ReplaySubject<int> publishSubject=ReplaySubject<int>();
//  publishSubject.add(1);
//  publishSubject.add(2);
//  publishSubject.add(3);
//  publishSubject.interval(Duration(seconds: 1)).listen((value) {
//    printString('listen1:$value');
//  });
//  publishSubject.add(4);
//  publishSubject.listen((value) {
//    printString('listen2:$value');
//  });
//  publishSubject.add(5);
//  publishSubject.add(6);
//  publishSubject.add(7);
}
