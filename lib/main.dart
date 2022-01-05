import 'package:flutter/material.dart';
import 'package:playground/cubit/counter_cubit.dart';
import 'package:playground/wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Playground',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
