abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterUpdateState extends CounterState {
  final int counter;
  CounterUpdateState(this.counter);
}
