import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/bean/TsmProviderBean.dart';
import 'package:flutter_app1/tsm_page/inherited/TsmShareInteritedWidget.dart';
import 'package:flutter_app1/tsm_page/inherited/provider/ChangeNotifyProvider.dart';
import 'package:flutter_app1/tsm_page/inherited/provider/Consumer.dart';
import 'package:flutter_app1/utils.dart';

class TsmInheritedSendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmInheritedSendPageState();
}

class _TsmInheritedSendPageState extends State<TsmInheritedSendPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Inherited 学习'),
        ),
        body: Container(
          child: Center(
              child: TsmShareInteritedWidget(
            data: count,
            child: ChangeNotifyProvider<TsmProviderBean>(
                data: TsmProviderBean(1, "消息"),
                child: Builder(
                  builder: (context) => Column(
                    children: [

                      Consumer<TsmProviderBean>(
                        builder: (context,data){
                          return Text(data.what.toString());
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),


                      Builder(builder: (context) {
                        printString("RaisedButton  build");
                        return RaisedButton(
                          child: Text('增加'),
                          onPressed: () {
                            ChangeNotifyProvider.of<TsmProviderBean>(context,
                                    useData: false)
                                .insertMessage("增加", 5);
                          },
                        );
                      })
                    ],
                  ),
                )),
          )),
        ),
      );
}
