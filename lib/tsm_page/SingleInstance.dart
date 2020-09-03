

import 'package:flutter/cupertino.dart';

typedef void   EventBusCallBack(arg);


/**
 * 单利模式,
 *
 * EventBus 注册模式,
 *
 *
 * 这里有一个比较有意思的地方就是,  EventBusCallBack(arg) arg 未指定类型,
 * 可以根据不同的key 注册不同的类型
 *
 */
class TsmSingleInstance{

  TsmSingleInstance.forInstance();

  static TsmSingleInstance  _instance=TsmSingleInstance.forInstance();

  factory TsmSingleInstance()=>_instance;


  Map<String,List<EventBusCallBack>> content=Map();

  add(String key,EventBusCallBack callBack){
    if(key==null||callBack==null)
      return;
    content[key]??=List<EventBusCallBack>();
    content[key].add(callBack);
  }




  off(String key,{EventBusCallBack callBack}){
    var list  =content[key];
    if(list==null){
      return;
    }
    if(callBack==null){
      content[key]=null;
      return;
    }
    list.remove(callBack);
  }


  commit(String key,[arg]){
    var list=content[key];
    if(list==null){
      return;
    }
    list.forEach((element) {element(arg);});
  }




}