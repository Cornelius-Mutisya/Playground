import 'dart:developer';

import 'package:flutter/material.dart';
// Websockets
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({Key? key}) : super(key: key);

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  void onConnectCallback(StompFrame connectFrame) {
    log('Connected');
    // client is connected and ready
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StompClient client = StompClient(
      config: StompConfig.SockJS(
          url: 'https://telematics.javaselfdrive.com/telematics/ws',
          onConnect: onConnectCallback),
    );
    client.activate();
    // client.subscribe(
    //     destination: '/topic/vehicle-asset/354018111979930',
    //     headers: {},
    //     callback: (frame) {
    //       // Received a frame for this subscription
    //       log('Frame.body >>> ' + frame.body.toString());
    //     });
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket'),
      ),
      body: const Center(
        child: Text('WebSocket'),
      ),
    );
  }
}
