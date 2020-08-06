
import 'dart:isolate';

import 'package:flutter_app1/utils.dart';





void main() async{

  ///想要接受回调  就必须将钩子传入 新的isolate中
  ///类似java中的回调, 只给回传消息的部分就可以了 ,也就是   sendPort
  ReceivePort  port=ReceivePort();
  ///必要参数 1 一个新的方法  如果不增加 await 关键字, 他的执行顺序就是
  ///先打印 main end 再打印 subTask,增加后先先打印  subTask  再打印 main end
    await Isolate.spawn<SendPort>(subTask, port.sendPort,);


    ///这两个方法的效果是一样的, 都是打印每一个结果
    port.listen((message) {printString('listen: $message') ;});
    port.forEach((element) {printString('forEach:$element');});

    ///监听第一条结果
    var result  =await  port.first;
    printString('main end $result');
}


void subTask(SendPort sendPort) async {

  for(int i=0;i<5;i++){
    sendPort.send('new Isolate wait $i second');
    printString('开始发送第$i个消息');
    await Future.delayed(Duration(seconds: 1));
  }
}
