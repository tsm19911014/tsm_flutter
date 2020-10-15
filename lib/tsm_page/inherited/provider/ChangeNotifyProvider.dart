


import 'package:flutter/cupertino.dart';

import 'Consumer.dart';

class ChangeNotifyProvider<T extends ChangeNotifier> extends StatefulWidget{

  final T data;
  final Widget child;

  ChangeNotifyProvider({Key key,this.child,@required this.data});


  @override
  State<StatefulWidget> createState() =>_ChangeNotifyProviderState<T>();


  static T of<T extends ChangeNotifier>(BuildContext buildContext,{bool useData=true}){
    if(useData){
      return buildContext.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>().data;
    }
    var p= buildContext.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget  as InheritedProvider<T>;
    return p?.data;
  }



}

class _ChangeNotifyProviderState<T extends ChangeNotifier> extends State<ChangeNotifyProvider<T>>{


  void update(){
    setState(() {

    });
  }

  @override
  void didUpdateWidget(ChangeNotifyProvider<T> oldWidget) {
    if(oldWidget.data!=widget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }


  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }


  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(widget.data,widget.child);
  }

}