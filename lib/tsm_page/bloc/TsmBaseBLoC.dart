



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
   */
  static T of<T extends TsmBaseBLoC>(BuildContext context){

    Element element=context as Element;
    if(element.widget.runtimeType==T){
      return  element.widget as T;
    }
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




