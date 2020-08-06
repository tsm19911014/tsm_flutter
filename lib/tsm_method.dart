import 'package:flutter_app1/utils.dart';

void  main(){
addMethod(one, two);///  感觉这种像是简写

///  这种写法就是    one参数需要一个name的入参,  two 方法需要一个value的入参
/// 这种写法的好处是可以对这个入参做修改,上面那种方式就比较死板,没办法对入参做修改
///  => 代表有返回   {} 代表无返回
addMethod((name) =>one(name+1.toString()) , (value) {two(value);});
}

String one(String str)=>'one $str ';

void  two(String str){
  printString( 'two $str ');
}

void  addMethod(String doWhat(String name),void doNext(String value)){
  String name=doWhat('tsm');
  doNext(name);
}