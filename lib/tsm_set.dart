
import 'package:flutter_app1/utils.dart';

void main(){
  Set<String> set={"2","4","5","8"};
  set.add('value');
  set.add(null);
  printString(set.toString());
  printString(set.lookup('1'));
  printString(testLookUp(set.lookup('1')));
  printString(testLookUp(set.lookup('5')));
  printString(set.toString());


  Map<String,String> map={'key':'value',null:"1"};
  printString(map.toString());

  printString(map[null]);
}

String testLookUp(String string)=> string??"value";
