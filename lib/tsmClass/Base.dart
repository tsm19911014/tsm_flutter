
import 'package:flutter_app1/utils.dart';

abstract class  Base{
  void  a(){
    printString(' Base  a()');
  }
  void  b(){
    printString(' Base  b()');
  }
  void  c(){
    printString(' Base  c()');
  }
  void d();
}

class BClass   extends Base{

  String name;
  @override
  void a(){
    printString('BClass a()');
    super.a();
  }
  @override
  void b(){
    printString('BClass b()');
    super.b();
  }
  @override
  void c(){
    super.c();
    printString('BClass c()');
  }
  @override
  void d() {
    printString('BClass d()');
  }
}





