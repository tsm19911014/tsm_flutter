


import 'dart:core';

import 'package:json_annotation/json_annotation.dart';


part  'TsmJsonUserBean.g.dart';


/**
 * json  转model 生成器
 *
 *    第一部需要标记  model   @JsonSerializable()
 *
 *
 *
 *   //删除并重新创建.g.dart文件
 *   flutter packages pub run build_runner build --delete-conflicting-outputs
 *
 *   每一次都手动运行命令生成文件特别麻烦, 一下命令可以观察只要生成了个文件,就会自动生成相关model
 *   flutter packages pub run build_runner watch
 */

@JsonSerializable()
class  TsmJsonUserBean{
  String name;
  int age;
  String tag;
  String flag;
  String push_id;

  TsmJsonUserBean();

  factory TsmJsonUserBean.fromJson(Map<String,dynamic> json)=>_$TsmJsonUserBeanFromJson(json);
  Map<String,dynamic> toJson()=>_$TsmJsonUserBeanToJson(this);
}