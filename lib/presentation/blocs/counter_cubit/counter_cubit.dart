import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState( counter: 5));

  void increaseBy ( int value) {
    emit(state.copyWith(
      counter:  state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }
   void decreaseBy ( int value) {
    emit(state.copyWith(
      counter:  state.counter - value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void rest () {
      emit(state.copyWith(
      counter: 0,
      ///transactionCount: state.transactionCount + 1,
    ));
  }
}
