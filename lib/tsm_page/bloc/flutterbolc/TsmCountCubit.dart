

import 'package:flutter_bloc/flutter_bloc.dart';

class TsmCountCubit extends Cubit<int>{


  TsmCountCubit(state) : super(state);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);


}