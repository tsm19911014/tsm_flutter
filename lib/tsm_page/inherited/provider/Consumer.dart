

import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/tsm_page/inherited/provider/ChangeNotifyProvider.dart';


class Consumer<T extends ChangeNotifier>  extends StatelessWidget{



  Consumer({@required this.builder,this.data});


  final T data;


  final  Widget Function(BuildContext buildContext,T  data)  builder;


  @override
  Widget build(BuildContext context )=>builder(context,ChangeNotifyProvider.of(context,useData: true));

}








class InheritedProvider<T extends ChangeNotifier> extends InheritedWidget {


  final T data;

  InheritedProvider(this.data,Widget child):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
   return true;
  }



}