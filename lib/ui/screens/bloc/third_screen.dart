import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/logic/cubit/counter_cubit.dart';
import 'package:playground/size_config.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Third Screen'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
