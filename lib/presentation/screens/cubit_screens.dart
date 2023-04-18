import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreeen extends StatelessWidget {
  const CubitCounterScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(), 
      child: _CubitCounterView()
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context , [int  value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        //title: Text('Contador Cubit : ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () => {
                    context.read<CounterCubit>().rest(),
                  },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          ///buildWhen: (previous, current) => current.counter != previous.counter, ///SE REDIBUJA SI Y SOLO SI CAMBIA
          builder: (context, state) {
            return Text('Valor del contador : ${state.counter} ');

            ///ESTO VIENE DEL BLOC
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',

              ///IDENTIFICADOR DE BOTONES
              child: const Text('+3'),
              onPressed: () =>  context.read<CounterCubit>().increaseBy(3),),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () =>  context.read<CounterCubit>().increaseBy(2),),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () =>  context.read<CounterCubit>().increaseBy(1),),        
        ],
      ),
    );
  }
}
