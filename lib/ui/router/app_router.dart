import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/logic/cubit/counter_cubit.dart';
import 'package:playground/ui/screens/bloc/flutter_bloc.dart';
import 'package:playground/ui/screens/bloc/second_screen.dart';
import 'package:playground/ui/screens/bloc/third_screen.dart';
import 'package:playground/ui/wrapper.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Wrapper(),
        );
      case '/blocExample':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const FlutterBocExample(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
