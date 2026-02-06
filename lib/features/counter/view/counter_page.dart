import 'package:blocappg14/features/counter/bloc/counter_bloc.dart';
import 'package:blocappg14/features/counter/bloc/counter_event.dart';
import 'package:blocappg14/features/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "inc",
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementPressed());
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: "desc",
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementPressed());
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            appBar: AppBar(title: Text("Counter Bloc")),
            body: Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    "Valor: ${state.value}",
                    style: TextStyle(fontSize: 28),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
