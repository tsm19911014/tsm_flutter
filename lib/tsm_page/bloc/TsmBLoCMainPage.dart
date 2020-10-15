


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page_routes.dart';
import 'package:flutter_app1/utils.dart';

class  TsmBLoCMainPage extends StatelessWidget{



    List<String> list;




  @override
  Widget build(BuildContext context) {

    list=['StreamBuilder 计数器','Flutter_BLoC 计数器'];

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC 学习'),
        centerTitle: true,
      ),
      body: ListView.separated(itemBuilder: (buildContext,index)=>getItemWidget(buildContext,index),
          separatorBuilder:(buildcontext,index)=>Divider(height: 1,) ,
          itemCount: list.length),
    );

  }


  getItemWidget(BuildContext context,int index){
    return FlatButton(
      child: Center(
        child: Text(list[index]),
      ),
      onPressed: (){
        switch(index){
          case 0:
            Navigator.of(context).pushNamed(page_routes_bloc_simple);
            break;
          case 1:
            Navigator.of(context).pushNamed(page_routes_flutter_bloc_count);
            break;
        }
      },
    ) ;
  }

}