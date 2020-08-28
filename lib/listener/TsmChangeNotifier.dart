


import 'package:flutter/widgets.dart';

class TsmChangeNotifier extends Listenable{

  List listeners=[];


  @override
  void addListener(listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    listeners.remove(listener);
  }

  void notifyAll(){
    listeners.forEach((element) { element();});
  }



}