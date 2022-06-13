import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<String, int> {
  CounterBloc() : super(0);

  int _counter = 0;

  @override
  Stream<int> mapToEventState(event) async* {
    if (event == 'add') {
      _counter++;
    } else {
      _counter--;
    }
    yield _counter;
  }
}
