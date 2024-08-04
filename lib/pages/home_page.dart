import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc page",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.deepOrange)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "this is counter",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.deepOrange),
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(
                "${state}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.deepOrange),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: Text('Increment'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: Text('Decrement'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterCubit>().reset(),
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: Icon(Icons.add),
        tooltip: 'Increment',
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
