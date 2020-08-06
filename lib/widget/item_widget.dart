import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

Widget getBottomWidget() {
  return Expanded(
    flex: 1,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.accessible,
            size: 16,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
          ),
          Text(
            '测试内容',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
    ),
  );
}


Widget  getItemWidget(BuildContext context, bool isFirst,int position){
  return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          boxShadow:[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0,1.0),
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: FlatButton(
        onPressed: (){
          if(isFirst){
            Navigator.of(context).pushNamed('/tsm/second',arguments: {'name':'value'}).then((value) => printString('返回结果$value'));
          }else{
            Navigator.of(context).pop('result');
          }
          printString('点击了条目$position');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '这个是标题',
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            Row(
              children: [
                getBottomWidget(),
                getBottomWidget(),
                getBottomWidget()
              ],
            ),
            Padding(padding: const EdgeInsets.only(bottom: 20),)
          ],
        ),
      ));
}





