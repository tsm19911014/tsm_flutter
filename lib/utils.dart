///受到保护的方法
void printString(dynamic string){
  if(string!=null){
    print('msg =${string?.toString()}');
  }

  String tsm='tsm';
  tsm.isPhone;
  tsm.isPhoneNum();
}



String checkEmptyString(String string)=>string??="";



extension ExtensionString on String{
  /// 这个是属性
  bool  get  isPhone=> this.isEmpty?true:false;
  ///这个方法
  bool  isPhoneNum()=>this.isEmpty?true:false;
}








class TestTsm{
  String _name;///  _ 开始的私有变量    外部不可以访问
  int age; ///  普通变量,外部可以访问


  ///  利用类名的构造方法,只可以有一个,即使是入参不同也不可以  代码报错
  TestTsm(String name){
    this._name=name;
  }

  ///Dart  新增构造方法   方法名随便来,
  TestTsm.forEmpty();

  TestTsm.forOthers({String name,this.age=0}){///  可选参数,并指定默认参数,  this.age=0  是缩写 私有变量不能这么写,
   this.name=name;/// 注意这里的name 我没加下划线,证明他不是上面的那个私有变量   而是调动下面的那个set  name的方法
  }

  String get name=>_name;

  void set name(name){
    this._name=name;
  }
}
