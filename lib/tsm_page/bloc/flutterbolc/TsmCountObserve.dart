



import 'package:flutter_app1/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TsmCountObserve extends BlocObserver{

  @override
  void onChange(Cubit cubit, Change change) {
    printString('${cubit.runtimeType} '+"     "+'$change');
    super.onChange(cubit, change);
  }

}