

import 'package:flutter_bloc/flutter_bloc.dart';

class TmsDioCubit extends Cubit<String>{


  TmsDioCubit() : super('');

  void afterDio(String body) => emit(body);
}