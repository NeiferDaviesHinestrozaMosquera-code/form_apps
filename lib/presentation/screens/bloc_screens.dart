import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/bloc/counter_bloc.dart';

class BlocCounterScreeen extends StatelessWidget {
  const BlocCounterScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('Contador Bloc : ${counterBloc.state.trasactionCount}'),
        ),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().add(CounterRest()),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
          child: context.select(
        (CounterBloc counterBloc) =>
            Text('Valor del contador : ${counterBloc.state.counter}'),
      )
          ///ACA ESTAMOS SELECCIONADO LA INFORMACION DESDE EL BLOC STATE
          ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',

              ///IDENTIFICADOR DE BOTONES
              child: const Text('+3'),
              onPressed: () => {increaseCounterBy(context, 3)}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2',
              child: const Text('+2'),
              onPressed: () => {increaseCounterBy(context, 2)}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3',
              child: const Text('+1'),
              onPressed: () => {increaseCounterBy(context)}),
        ],
      ),
    );
  }
}
