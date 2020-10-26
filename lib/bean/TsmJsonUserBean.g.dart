// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TsmJsonUserBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TsmJsonUserBean _$TsmJsonUserBeanFromJson(Map<String, dynamic> json) {
  return TsmJsonUserBean()
    ..name = json['name'] as String
    ..age = json['age'] as int
    ..tag = json['tag'] as String
    ..flag = json['flag'] as String
    ..push_id = json['push_id'] as String;
}

Map<String, dynamic> _$TsmJsonUserBeanToJson(TsmJsonUserBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'tag': instance.tag,
      'flag': instance.flag,
      'push_id': instance.push_id,
    };
