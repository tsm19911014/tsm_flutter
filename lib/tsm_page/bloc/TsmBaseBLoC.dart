



import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class TsmBaseBLoC{

  /**
   *  用来调用 streamcontroller.close()
   */
  void dispose();





}


class TsmBaseBLoCWidget<T extends TsmBaseBLoC > extends StatefulWidget{

  final Widget child;

  final T bloc;


  TsmBaseBLoCWidget({Key key, @required this.child, @required this.bloc}):super(key:key);


  @override
  State<StatefulWidget> createState() =>_TsmBaseBLoCState<T>();

  /**
   * 便于子Widget 通过此方法向上
   * 此方法不能在 TsmBaseBLoCWidget 的child直接使用,需要使用StatelessWidget 或者StatefulWidget
   * 包裹一层,原因是 在findAncestorWidgetOfExactType 这个方法是直接查找他们_parent ,并没有比对自身
   * 他的直接 包裹的子Widget 的bloc 直接使用初始化的就可以了,
   *
   */
  static T of<T extends TsmBaseBLoC>(BuildContext context){
    TsmBaseBLoCWidget<T> provider = context.findAncestorWidgetOfExactType<TsmBaseBLoCWidget<T>>();
    return provider.bloc;
  }

}

class _TsmBaseBLoCState<T> extends State<TsmBaseBLoCWidget>{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }


  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }


}




