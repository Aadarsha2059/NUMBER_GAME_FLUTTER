import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Cubit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterCubitView(),
      ),
    );
  }
}


class CounterCubitView extends StatelessWidget {
  const CounterCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
