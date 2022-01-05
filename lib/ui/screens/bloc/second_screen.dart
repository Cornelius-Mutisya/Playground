import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/logic/cubit/counter_cubit.dart';
import 'package:playground/size_config.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You\'ve pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue == 5) {
                    return Text(
                      'Yeey ' + state.counterValue.toString() + ' is here',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      state.counterValue.toString() + ' is even',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
                listener: (context, state) {
                  // ignore: todo
                  // TODO: implement listener

                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    child: const Icon(Icons.remove),
                    tooltip: 'Decrement',
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Icon(Icons.add),
                    tooltip: 'Increment',
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              // MaterialButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => SecondScreen()));
              //   },
              //   child: Text('SecondScreen'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
