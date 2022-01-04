import 'package:flutter/material.dart';
import 'package:playground/size_config.dart';

class Neumorphism extends StatefulWidget {
  const Neumorphism({Key? key}) : super(key: key);

  @override
  _NeumorphismState createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade300,
                          builder: (context) {
                            return Container(
                              height: SizeConfig.screenHeight * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(110),
                                    height: getProportionateScreenHeight(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0.1, -0.2),
                                          color: Colors.white.withOpacity(0.85),
                                          blurRadius: 1,
                                        ),
                                        BoxShadow(
                                          offset: Offset(2, 2),
                                          color: Colors.black12,
                                          blurRadius: 1,
                                        ),
                                      ],
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.8,
                                    height: getProportionateScreenHeight(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.85),
                                          spreadRadius: 0.5,
                                          blurRadius: 0,
                                          blurStyle: BlurStyle.solid,
                                          offset: Offset(
                                            0.1,
                                            0.1,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.black26,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Container(
                                    height: getProportionateScreenHeight(200),
                                    width: SizeConfig.screenWidth * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.grey.shade300,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(10, 10),
                                              color: Colors.black38,
                                              blurRadius: 20),
                                          BoxShadow(
                                              offset: Offset(-10, -10),
                                              color: Colors.white
                                                  .withOpacity(0.85),
                                              blurRadius: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(30),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.8,
                                    height: getProportionateScreenHeight(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.85),
                                          spreadRadius: 0.5,
                                          blurRadius: 0,
                                          blurStyle: BlurStyle.solid,
                                          offset: Offset(
                                            0.1,
                                            0.1,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Show bottom sheet'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
