

import 'package:flutter_app1/utils.dart';

void main(){
  List a=[4,5,6,7];

  List b=[1,...a,9,3,5];

  printString("b:"+b.toString());

  List c=[11,22,33];






  List f=null;
  List d=[2,3,4,...?f];
  printString("d:"+d.toString());



  List e=[...?c]
    ..addAll(f != null?f:[]);
  printString("e:"+e.toString());


  List randomList=List.generate(6, (index) => _addItem(index:index,lastIndex: (index+1)),growable: false);
  printString("randomList:"+randomList.toString());



  _addItem(index: 1);
}

int _addItem({int index=0,int lastIndex=1}){
  return index*lastIndex;
}
