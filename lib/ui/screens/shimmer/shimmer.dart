import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playground/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  _ShimmerScreenState createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  bool _enabled = true;
  @override
  void initState() {
    // Timer(const Duration(seconds: 5), () {
    //   Navigator.pop(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: _enabled,
                  child: ListView.builder(
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.3,
                            height: SizeConfig.screenHeight * 0.1,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: getProportionateScreenHeight(8),
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: getProportionateScreenHeight(8),
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(40),
                                  height: getProportionateScreenHeight(8),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: 6,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        _enabled = !_enabled;
                      });
                    },
                    child: Text(
                      _enabled ? 'Stop' : 'Play',
                      style: Theme.of(context).textTheme.button!.copyWith(
                          fontSize: 18.0,
                          color: _enabled ? Colors.redAccent : Colors.green),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
