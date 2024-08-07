import 'package:bloc_cubit/cubits/colors_cubit/colors_cubit.dart';
import 'package:bloc_cubit/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_cubit/cubits/user_cubit/user_cubit.dart';
import 'package:bloc_cubit/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ColorsCubit()),
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => UserCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Bloc Cubit",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
