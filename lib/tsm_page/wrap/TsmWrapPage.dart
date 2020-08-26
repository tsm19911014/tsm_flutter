import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmWarpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      '线性',
      '基础控',
      '可滚',
      '可滚动控件',
      '可滚',
      '可',
      '基础控件',
      'sdc',
    ];

    List<String> list_string = [];

    for(int i=0;i<15;i++){
      list_string.addAll(list);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Warp学习'),
          centerTitle: true,
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Wrap(
                children: list_string.map((e) => _getItem(e)).toList(),
                /**
                 * WrapAlignment.spaceBetween  两头靠边
                 * WrapAlignment.center  居中
                 * WrapAlignment.spaceAround 剩余控件均匀分配到所有子条目之间,第一个前面,和最后一个后面也有一半,
                 * WrapAlignment.spaceEvenly 剩余控件均匀分配到所有子条目上,第一个前面,和最后一个后面也有,
                 */
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                verticalDirection: VerticalDirection.down,

                ///up:从下到上    down:从上到下
                spacing: 10,

                ///水平方向两个item的距离
                runSpacing: 5,

                ///垂直方向上下item的距离
              ),
            ),
          ),
        ));
  }
}

Widget _getItem(String content) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.yellowAccent, width: 2)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.panorama,
          color: Colors.greenAccent,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          content,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
