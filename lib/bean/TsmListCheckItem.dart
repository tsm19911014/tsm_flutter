





import 'dart:collection';

import 'package:flutter_app1/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  TsmListCheckItem extends Bloc<int,Map<int,bool>>{



  TsmListCheckItem(Map<int,bool>  initialState) : super(initialState);


  @override
  Stream<Transition<int, Map<int, bool>>> transformTransitions(Stream<Transition<int, Map<int, bool>>> transitions) {
    return super.transformTransitions(transitions);
  }

//  @override
//  void onChange(Change<Map<int, bool>> change) {
//    printString(change.currentState);
//    printString(change.nextState);
//    super.onChange(change);
//  }



  @override
  Stream<Map<int,bool>> mapEventToState(int index) async*{
    HashMap<int ,bool> nextState=HashMap();
    state.forEach((key, value) {nextState.putIfAbsent(key, () => value);});
    nextState[index]=!state[index];
    yield nextState;
  }

  static TsmListCheckItem  forInstance(Map<int,bool> map) {
    TsmListCheckItem item=TsmListCheckItem(map);
    return item;
  }

}