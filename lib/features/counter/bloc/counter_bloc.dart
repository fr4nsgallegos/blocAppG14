import 'package:blocappg14/features/counter/bloc/counter_event.dart';
import 'package:blocappg14/features/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<CounterIncrementPressed>((event, emit) {
      final newValue = state.value + 1;
      emit(CounterState(value: newValue));
    });

    on<CounterDecrementPressed>((event, emit) {
      final newValue = state.value - 1;
      emit(CounterState(value: newValue));
    });
  }
}
