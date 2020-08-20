import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmSingleChildScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
        centerTitle: true,
      ),
      body: Scrollbar(
        ///添加进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
              children: str
                  .split("")
                  .map((e) => Container(
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(
                            e,
                            textScaleFactor: 2,
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
