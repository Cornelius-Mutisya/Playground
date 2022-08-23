import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:playground/size_config.dart';
import 'package:playground/ui/screens/battery/batter_indicator.dart';
import 'package:playground/ui/screens/call/call_log_screen.dart';
import 'package:playground/ui/screens/charts/radial_bar_gradient.dart';
import 'package:playground/ui/screens/containerTransform/container_transform.dart';
import 'package:playground/ui/screens/countdown/countdown.dart';
import 'package:playground/ui/screens/dio/dio_screen.dart';
import 'package:playground/ui/screens/dotted/dotted_border.dart';
import 'package:playground/ui/screens/firebase/firebase.dart';
import 'package:playground/ui/screens/neumorphism/neumorphism.dart';
import 'package:playground/ui/screens/onBoarding/onboarding.dart';
import 'package:playground/ui/screens/qr/qr_scanner.dart';
import 'package:playground/ui/screens/riverpod/riverpod_screen.dart';
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
        child: SingleChildScrollView(
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
                                builder: (context) => const RiverpodScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          child: const Text('Riverpod'),
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
                                builder: (context) => const SimpleDI()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          child: const Text('Simple DI'),
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
                                builder: (context) => const CallLogScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text('Call Logs'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                          child: const Text('Shimmer'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text('CupertinoSegmentedControl'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: const Text('Transform'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                          ),
                          child: const Text('Neumorphism'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          child: const Text('Dio'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),
                          child: const Text('Bloc'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                          ),
                          child: const Text('Services'),
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
                                    const OnBoardingScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text('Onboarding'),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellowAccent,
                          ),
                          child: const Text(
                            'FilterSearch',
                            style: TextStyle(color: Colors.black),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),
                          child: const Text(
                            'WebViewPage',
                            style: TextStyle(color: Colors.black),
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
                                    const RadialBarGradient()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text(
                            'RadialBarGradient',
                            style: TextStyle(color: Colors.black),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: const Text(
                            'Countdown Timer',
                            style: TextStyle(color: Colors.white),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),
                          child: const Text(
                            'WebSocketScreen',
                            style: TextStyle(color: Colors.white),
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
                                    const BatteryIndicatorScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                          child: const Text(
                            'BatteryIndicatorScreen',
                            style: TextStyle(color: Colors.black),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: const Text(
                            'StaggeredScreen',
                            style: TextStyle(color: Colors.white),
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
                                    const DottedBorderExample()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: const Text(
                            'DottedBorder',
                            style: TextStyle(color: Colors.white),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text(
                            'QRCodeScreen',
                            style: TextStyle(color: Colors.black),
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
      ),
    );
  }
}
