import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubits/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;
  counterIncrement() {
    counter = counter + 1;
    emit(CounterUpdateState(counter));
  }

  counterDecrement() {
    if (counter > 0) {
      counter = counter - 1;
      emit(CounterUpdateState(counter));
    }
  }

  counterReset() {
    counter = 0;
    emit(CounterUpdateState(counter));
  }
}
