import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:playground/size_config.dart';
import 'package:playground/ui/screens/charts/radial_bar_gradient.dart';
import 'package:playground/ui/screens/containerTransform/container_transform.dart';
import 'package:playground/ui/screens/countdown/countdown.dart';
import 'package:playground/ui/screens/dio/dio_screen.dart';
import 'package:playground/ui/screens/firebase/firebase.dart';
import 'package:playground/ui/screens/neumorphism/neumorphism.dart';
import 'package:playground/ui/screens/onBoarding/onboarding.dart';
import 'package:playground/ui/screens/qr/qr_scanner.dart';
import 'package:playground/ui/screens/search/search.dart';
import 'package:playground/ui/screens/segmented/segmented_control.dart';
import 'package:playground/ui/screens/shimmer/shimmer.dart';
import 'package:playground/ui/screens/simpleDi/simple_di.dart';
import 'package:playground/ui/screens/staggered/staggered_grid.dart';
import 'package:playground/ui/screens/webview/webview.dart';
import 'package:playground/ui/websockets/stomp_client_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String _qrResult = '';
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
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WebViewPage()));
                        },
                        child: const Text(
                          'WebViewPage',
                          style: TextStyle(color: Colors.black),
                        ),
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
                              builder: (context) => const RadialBarGradient()));
                        },
                        child: const Text(
                          'RadialBarGradient',
                          style: TextStyle(color: Colors.black),
                        ),
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
                              builder: (context) => const CountdownScreen()));
                        },
                        child: const Text(
                          'Countdown Timer',
                          style: TextStyle(color: Colors.white),
                        ),
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
                              builder: (context) => const WebSocketScreen()));
                        },
                        child: const Text(
                          'WebSocketScreen',
                          style: TextStyle(color: Colors.white),
                        ),
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
                              builder: (context) => const StaggeredScreen()));
                        },
                        child: const Text(
                          'StaggeredScreen',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final String res = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const QRCodeScreen()),
                          );
                          log('qr addresssssssss: $res');
                          SchedulerBinding.instance.addPostFrameCallback(
                            (_) => setState(() {
                              _qrResult = res;
                            }),
                          );
                        },
                        child: const Text(
                          'QRCodeScreen',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'QR Result: $_qrResult',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
