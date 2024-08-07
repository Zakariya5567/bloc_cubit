import 'package:bloc_cubit/cubits/colors_cubit/colors_cubit.dart';
import 'package:bloc_cubit/cubits/colors_cubit/colors_state.dart';
import 'package:bloc_cubit/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_cubit/cubits/counter_cubit/counter_state.dart';
import 'package:bloc_cubit/screen/colors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counterscreen extends StatelessWidget {
  const Counterscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Counter",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 200,
          height: 60,
          child: Row(
            children: [
              CustomFloatingButton(
                  color: Colors.blueGrey,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().counterIncrement();
                  }),
              const SizedBox(
                width: 15,
              ),
              CustomFloatingButton(
                  color: Colors.blueGrey,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().counterDecrement();
                  }),
              const SizedBox(
                width: 15,
              ),
              CustomFloatingButton(
                  color: Colors.blueGrey,
                  child: const Icon(
                    Icons.loop,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().counterReset();
                  }),
            ],
          ),
        ),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (BuildContext context, state) {
            if (state is CounterUpdateState) {
              return Center(
                child: Text(
                  "Counter : ${state.counter}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Counter : 0",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              );
            }
          },
        ));
  }
}
