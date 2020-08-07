
import 'package:flutter_app1/utils.dart';

import 'Base.dart';

abstract class AClass {

  void a(){
    printString('AClass a()');
  }

  void b(){
    printString('AClass b()');
  }
}

class AClass2{


  void a(){
    printString('AClass2 a()');
  }

  void g(){
    printString('AClass2 g()');
  }
}

class CClass extends BClass with AClass,AClass2{

  String name;
  int age;

  CClass.forEmptye();

  CClass(this.name,this.age);

  CClass.forName(this.name);

  CClass.forOthers({this.name="",this.age=0});
}





//class CClass = BClass with AClass,AClass2;

