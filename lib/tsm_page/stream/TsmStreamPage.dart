



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TsmStream.dart';

class TsmStreamPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>TsmStreamState();
}


class TsmStreamState extends State<TsmStreamPage>{
  TsmStream tsmStream;

  @override
  void initState() {
    tsmStream=TsmStream();
    tsmStream.first();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream 学习"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text("加入数据"),
          onPressed: (){
            tsmStream.init();
          },
        ),
      ),
    );

  }

  @override
  void dispose() {
    tsmStream.close();
    super.dispose();
  }


}
