import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/bean/TsmListCheckItem.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TsmListViewCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmListViewCheckState();
}

class _TsmListViewCheckState extends State<TsmListViewCheckPage> {
  ScrollController _controller;

  List<String> list;
  Map<int,bool> map;

  @override
  void initState() {
    _controller = ScrollController();
    list = ['测试1', '测试2', '测试3', '测试4', '测试5', '测试6', '测试7', '测试8', '测试9'];
    map=HashMap();
    for(int i=0;i<list.length;i++){
      map.putIfAbsent(i, () => false);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView 勾选'),
          centerTitle: true,
        ),
        body:BlocProvider(
          create: (_) => TsmListCheckItem.forInstance(map),
          child:ListView.builder(
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
              controller: _controller,
              itemBuilder: (con, index) {
                return  _TsmItemWidget(list[index], index,map);
              }),
        )


        );
  }
}

class _TsmItemWidget extends StatelessWidget {
  final String _tag;
  final Map<int,bool> _map;
  final int index;

  _TsmItemWidget(this._tag, this.index,this._map);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TsmListCheckItem, Map<int, bool>>(
      listener: (con,state){
//        _map[index]=!_map[index];
      },
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage('images/hor.jpg'),
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 22,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6))),
                  child: Text(_tag),
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
                child: Text(_tag * 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(index.toString()),
              BlocBuilder<TsmListCheckItem, Map<int, bool>>(
                builder: (con, state) {
                  return Checkbox(
                    value: state[index],
                    activeColor: Colors.redAccent,
                    /// 勾选后颜色
                    onChanged: (isSelect) {
                      context.bloc<TsmListCheckItem>().add(index);
                    },
                  );
                },
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
