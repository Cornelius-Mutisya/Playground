import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playground/logic/cubit/counter_cubit.dart';
import 'package:playground/ui/router/app_router.dart';
import 'package:playground/ui/screens/bloc/flutter_bloc.dart';
import 'package:playground/ui/screens/bloc/second_screen.dart';
import 'package:playground/ui/screens/bloc/third_screen.dart';
import 'package:playground/ui/wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterCubit = CounterCubit();

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Playground',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        // routes: {
        //   '/': (context) => const Wrapper(),
        //   '/blocExample': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const FlutterBocExample(),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const SecondScreen(),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const ThirdScreen(),
        //       ),
        // },

        onGenerateRoute: _appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  void dispose() {
    // _counterCubit.close();
    _appRouter.dispose();
    super.dispose();
  }
}
