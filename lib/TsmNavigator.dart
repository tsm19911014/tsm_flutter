

import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';


class TsmNavigator{

  /**
   * 是否是否Flutter Boost
   */
  get  isFlutterBoost=>false;


  TsmNavigator._();

  static TsmNavigator _instance=TsmNavigator._();

  factory TsmNavigator.getInstance()=>_instance;

  static open(BuildContext context,String routeName,{dynamic arguments}){
    if(TsmNavigator.getInstance().isFlutterBoost){
      FlutterBoost.singleton.open(routeName);
    }else{
      Navigator.of(context).pushNamed(routeName,arguments: arguments);
    }
  }

  static pop(BuildContext context,dynamic result){
    if(TsmNavigator.getInstance().isFlutterBoost){
      final BoostContainerSettings settings = BoostContainer.of(context).settings;
      FlutterBoost.singleton.close(settings.uniqueId,result: <String, dynamic>{'result': result});
    }else{
      Navigator.of(context).pop(result);
    }
  }

}









