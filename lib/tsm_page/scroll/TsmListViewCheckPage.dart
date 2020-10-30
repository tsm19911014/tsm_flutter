




import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmListViewCheckPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_TsmListViewCheckState();

}

class _TsmListViewCheckState extends State<TsmListViewCheckPage>{



  ScrollController _controller;

  List<String> list;

  Map<int,int> map;

  @override
  void initState() {
    _controller=ScrollController();
    list=['测试1','测试2','测试3','测试4','测试5','测试6','测试7','测试8','测试9'];
    map=HashMap();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView 勾选'),
        centerTitle: true,
      ),

      body: ListView.builder(
           itemCount: list.length,
          physics: BouncingScrollPhysics(),
          controller: _controller,
          itemBuilder: (con,index){
        return GestureDetector(
          onTap: (){
            printString(map.toString());
          },
          child: _TsmItemWidget(list[index],map,index),
        );
      }),
    );
  }
}


class _TsmItemWidget extends StatefulWidget{

  final String _tag;
  final Map<int,int> _map;
  final int index;

  _TsmItemWidget(this._tag,this._map,this.index);



  @override
  State<StatefulWidget> createState() =>_TsmItemState();

}

class _TsmItemState extends State<_TsmItemWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                child: ClipRRect(child: Image(image: AssetImage('images/hor.jpg'),width: double.infinity, fit: BoxFit.fitWidth,),
                  borderRadius: BorderRadius.all(Radius.circular(6)), ) ,
              ),
            ),

            Positioned(
              top: 10,
              left: 22,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomRight: Radius.circular(6))
                ),
                child: Text(widget._tag),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Text(widget._tag*12),
            ),

            SizedBox(
              width: 10,
            ),

            Text(widget._map.toString()),
            Checkbox(
              value: widget._map.containsKey(widget.index),
              activeColor: Colors.redAccent,
              /// 勾选后颜色
              onChanged: (isSelect) {
                setState(() {
                  if(widget._map.containsKey(widget.index)){
                    widget._map.removeWhere((key, value) => key==widget.index);
                  }else{
                    widget._map.putIfAbsent(widget.index, () => widget.index);
                  }
                });
              },
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )

      ],
    );
  }
}








