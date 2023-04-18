part of 'counter_bloc.dart';

 class CounterState extends Equatable {

  final int counter ;
  final int  trasactionCount;

  CounterState({
    this.counter = 0, 
    this.trasactionCount = 0
  });

  CounterState copyWith({
      int? counter,
      int? trasactionCount,
  }) => CounterState(
  counter: counter ?? this.counter,
  trasactionCount: trasactionCount ?? this.trasactionCount
  );

  
  @override
  List<Object> get props => [counter,trasactionCount];  ///TODO LO QUE SE NECESITA EVALUAR VA ACA


}


