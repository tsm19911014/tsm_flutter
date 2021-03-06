import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../tsm_page_routes.dart';

class TsmAnimMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      '普通动画',
      'AnimatedBuilder 学习',
      'Hero 动画',
      '交织动画',
      'AnimatedSwitcher 学习',
      '自己封装背景色过渡动画和显示动画'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('动画列表'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(list[index]),
            ),
          ),
          onTap: (){
            openPage(context, index);
          },
        ),
        itemCount: list.length,
        separatorBuilder: (context ,index)=>Divider(),
      ),
    );
  }
}

openPage(BuildContext context,int index){
  switch(index){
    case 0:
      Navigator.of(context).pushNamed(page_routes_anim);
      break;
    case 1:
      Navigator.of(context).pushNamed(page_routes_animated_builder);
      break;
    case 2:
      [Permission.storage, Permission.camera].request()
        ..then((value) {
          if (value[Permission.storage].isGranted) {
            if (value[Permission.camera].isGranted) {
              Navigator.of(context).pushNamed(page_routes_iamge);
            }
          }
        });
      break;
    case 3:
      Navigator.of(context).pushNamed(page_routes_stagger_route);
      break;
    case 4:
      Navigator.of(context).pushNamed(page_routes_animated_switcher);
      break;
    case 5:
      Navigator.of(context).pushNamed(page_routes_custom_scroll_view);
      break;
  }
}

