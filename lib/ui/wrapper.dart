import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/size_config.dart';
import 'package:playground/ui/screens/bloc/flutter_bloc.dart';
import 'package:playground/ui/screens/containerTransform/container_transform.dart';
import 'package:playground/ui/screens/dio/dio_screen.dart';
import 'package:playground/ui/screens/firebase/firebase.dart';
import 'package:playground/ui/screens/neumorphism/neumorphism.dart';
import 'package:playground/ui/screens/onBoarding/onboarding.dart';
import 'package:playground/ui/screens/search/search.dart';
import 'package:playground/ui/screens/segmented/segmented_control.dart';
import 'package:playground/ui/screens/shimmer/shimmer.dart';
import 'package:playground/ui/screens/simpleDi/simple_di.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(10)),
          child: SizedBox(
            width: SizeConfig.screenWidth * 0.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SimpleDI()));
                        },
                        child: const Text('Simple DI'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ShimmerScreen()));
                        },
                        child: const Text('Shimmer'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const CupertinoSegmentedControlDemo()));
                        },
                        child: const Text('CupertinoSegmentedControl'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const OpenContainerTransformDemo()));
                        },
                        child: const Text('Transform'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Neumorphism()));
                        },
                        child: const Text('Neumorphism'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DioScreen()));
                        },
                        child: const Text('Dio'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/blocExample');
                        },
                        child: const Text('Bloc'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FirebaseScreen()));
                        },
                        child: const Text('Services'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen()));
                        },
                        child: const Text('Onboarding'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FilterSearch()));
                        },
                        child: const Text(
                          'FilterSearch',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellowAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
