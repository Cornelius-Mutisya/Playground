import 'package:flutter/material.dart';
import 'package:playground/screens/containerTransform/container_transform.dart';
import 'package:playground/screens/segmented/segmented_control.dart';
import 'package:playground/screens/shimmer/shimmer.dart';
import 'package:playground/size_config.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
