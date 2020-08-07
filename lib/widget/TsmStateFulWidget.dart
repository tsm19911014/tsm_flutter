import 'package:flutter/material.dart';
import '../tsm_page_routes.dart';
import 'ViewInflate.dart';
import 'file:///D:/User/flutter_app1/lib/widget/item_widget.dart';
import 'package:flutter_app1/utils.dart';

class TsmStateFulWidget extends StatefulWidget {
  final String title;

  final bool isFirst;

  TsmStateFulWidget(this.title, this.isFirst);

  @override
  _TsmStateFulState createState() => _TsmStateFulState(title, isFirst);
}

class _TsmStateFulState extends State<TsmStateFulWidget> {
  final String conetent;
  final bool isFirst;

  _TsmStateFulState(this.conetent, this.isFirst);

  @override
  void initState() {
    super.initState();
    printString(
        'TsmStateFulWidget   initState'); ////类似于 onCreate 创建时才执行,整个生命周期中只执行一次
//    Future.delayed(const  Duration(seconds: 5),_onClickListeners);
  }

  @override
  void dispose() {
    super.dispose();
    printString(
        'TsmStateFulWidget dispose'); ////类似于 onDestroy 销毁才执行,整个生命周期中只执行一次
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    printString('TsmStateFulWidget  didChangeDependencies'); ////状态发生变化后执行
  }

  @override
  void didUpdateWidget(TsmStateFulWidget oldWidget) {
    printString('TsmStateFulWidget  didUpdateWidget');
    super.didUpdateWidget(oldWidget);

    ///当自身的状态发生变化时子节点该方法会被调用
  }

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlatButton(
        onPressed: () {
//          showSnackBar(context);
//          createBottomSheet(context);
//          createModalBottomSheet(context);
          if(isFirst){
            Navigator.of(context).pushNamed(page_routes_appbar,arguments: {'name':'value'}).then((value) => printString('返回结果$value'));
          }else{
            Navigator.of(context).pop('result');
          }
        },
        child: Center(
          child: Text(conetent ?? 'This is Simple Text',
              style: TextStyle(color: Colors.black, fontSize: 14.0)),
        ),
      ),
//      child: ListView.builder(itemBuilder: (BuildContext,int)=>getItemWidget(context,isFirst,int),itemCount: 20,),
    );
  }
}

/**
 * 任意地方都能创建,
 */
createModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 300,
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: inflateText('showModalBottomSheet', Colors.black87, 14),
              ),
            ),
          )).then((value) => printString(value)).whenComplete(
      () => printString('whenComplete'));
}

/**
 * 不能再scaffold 中直接创建,只能在scaffold 的body中创建,
 * 而且还必须被scaffold 嵌套才可以创建,否则运行报错,
 */
createBottomSheet(BuildContext context) {
  showBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 300,
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: inflateText('showBottomSheet', Colors.black87, 14),
              ),
            ),
          ));
}

/// 创建snackBar 没有什么好说的,都是属性,挨个试一下就好了
showSnackBar(BuildContext context) {
  Scaffold.of(context).hideCurrentSnackBar();
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.grey,
    duration: const Duration(seconds: 2),
    content: Text('This is SnackBar',
        style: TextStyle(color: Colors.black, fontSize: 14.0)),
    action: SnackBarAction(
      label: '撤销',
      onPressed: () {
        printString('点击了snackbar');
      },
    ),
  ));
}
