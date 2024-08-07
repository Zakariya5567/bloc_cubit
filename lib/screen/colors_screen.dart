import 'package:bloc_cubit/cubits/colors_cubit/colors_cubit.dart';
import 'package:bloc_cubit/cubits/colors_cubit/colors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Colorscreen extends StatelessWidget {
  const Colorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Colors",
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
                  color: Colors.red,
                  child: const Text("Red"),
                  onPressed: () {
                    context.read<ColorsCubit>().colorUpdate(Colors.red, "Red");
                  }),
              const SizedBox(
                width: 15,
              ),
              CustomFloatingButton(
                  color: Colors.green,
                  child: const Text("Green"),
                  onPressed: () {
                    context
                        .read<ColorsCubit>()
                        .colorUpdate(Colors.green, "Green");
                  }),
              const SizedBox(
                width: 15,
              ),
              CustomFloatingButton(
                  color: Colors.blue,
                  child: const Text("Blue"),
                  onPressed: () {
                    context
                        .read<ColorsCubit>()
                        .colorUpdate(Colors.blue, "Blue");
                  }),
            ],
          ),
        ),
        body: BlocBuilder<ColorsCubit, ColorsState>(
          builder: (BuildContext context, state) {
            if (state is ColorsUpdateState) {
              return Center(
                child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: state.color),
                    child: Center(
                      child: Text(
                        state.colorName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              );
            } else {
              return Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueGrey),
                ),
              );
            }
          },
        ));
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.color,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
