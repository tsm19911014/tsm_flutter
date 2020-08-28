

import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/tsm_page/inherited/provider/ChangeNotifyProvider.dart';


class Consumer<T extends ChangeNotifier>  extends StatelessWidget{



  Consumer({@required this.builder,this.data});


  T data;


  Widget Function(BuildContext buildContext,T  data) builder;


  @override
  Widget build(BuildContext context )=>builder(context,ChangeNotifyProvider.of(context,useData: true));

}








// ignore: must_be_immutable
class InheritedProvider<T extends ChangeNotifier> extends InheritedWidget {


  T data;

  InheritedProvider(this.data,Widget child):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
   return true;
  }



}