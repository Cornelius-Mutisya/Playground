import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/material.dart';

class BatteryIndicatorScreen extends StatefulWidget {
  const BatteryIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<BatteryIndicatorScreen> createState() => _BatteryIndicatorScreenState();
}

class _BatteryIndicatorScreenState extends State<BatteryIndicatorScreen> {
  final _styleItems = [
    const DropdownMenuItem(
      child: Text('skeumorphism'),
      value: 1,
    ),
    const DropdownMenuItem(
      child: Text('flat'),
      value: 0,
    ),
  ];
  var _styleIndex = 0;

  var _colorful = true;

  var _showPercentSlide = true;
  var _showPercentNum = false;

  var _size = 18.0;

  var _ratio = 3.0;

  Color _color = Colors.blue;

  int bat = 34;

  void increment() {
    setState(() {
      if (bat < 100) {
        bat++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (bat > 0) {
        bat--;
      }
    });
  }

  Widget getColorSelector(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print(color);
          _color = color;
        });
      },
      child: CircleAvatar(
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Indicator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Battery Indicator',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: Center(
              child: BatteryIndicator(
                batteryFromPhone: false,
                batteryLevel: bat,
                style: BatteryIndicatorStyle.values[_styleIndex],
                colorful: _colorful,
                showPercentNum: _showPercentNum,
                mainColor: _color,
                size: _size,
                ratio: _ratio,
                showPercentSlide: _showPercentSlide,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('color:'),
                getColorSelector(Colors.blue),
                getColorSelector(Colors.red),
                getColorSelector(Colors.black),
                getColorSelector(Colors.grey),
                getColorSelector(Colors.yellow),
                getColorSelector(Colors.green),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('size:'),
                Expanded(
                  child: Slider(
                    min: 8.0,
                    max: 48.0,
                    divisions: 300,
                    label: _size.toStringAsFixed(1),
                    value: _size,
                    onChanged: (val) {
                      setState(() {
                        _size = val;
                      });
                    },
                  ),
                ),
                const Text('ratio:'),
                Expanded(
                  child: Slider(
                    min: 1.0,
                    max: 4.0,
                    divisions: 30,
                    label: _ratio.toStringAsFixed(1),
                    value: _ratio,
                    onChanged: (val) {
                      setState(() {
                        _ratio = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text('colorful:'),
              Checkbox(
                value: _colorful,
                onChanged: (val) {
                  setState(() {
                    _colorful = val ?? _colorful;
                  });
                },
              ),
              const Text('percentNum:'),
              Checkbox(
                value: _showPercentNum,
                onChanged: (val) {
                  setState(() {
                    _showPercentNum = val ?? _showPercentNum;
                  });
                },
              ),
              const Text('percentSlide:'),
              Checkbox(
                value: _showPercentSlide,
                onChanged: (val) {
                  setState(() {
                    _showPercentSlide = val ?? _showPercentSlide;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text('style:'),
              DropdownButton(
                value: _styleIndex,
                items: _styleItems,
                onChanged: (val) {
                  setState(() {
                    _styleIndex = val as int;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: decrement, child: const Text("Down")),
              ElevatedButton(onPressed: increment, child: const Text("Up")),
            ],
          )
        ],
      ),
    );
  }
}
