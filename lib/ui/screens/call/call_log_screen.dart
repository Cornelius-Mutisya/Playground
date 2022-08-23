import 'dart:developer';

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogScreen extends StatefulWidget {
  const CallLogScreen({Key? key}) : super(key: key);

  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  @override
  void initState() {
    getCall();
    super.initState();
  }

  void getCall() async {
    // GET WHOLE CALL LOG
    Iterable<CallLogEntry> entries = await CallLog.get();
    log('call log entries: $entries');
    setState(() {
      _callLogEntries = entries;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle mono = TextStyle(
      fontFamily: 'monospace',
      color: Colors.black,
    );
    final List<Widget> watoi = <Widget>[];
    for (CallLogEntry entry in _callLogEntries) {
      watoi.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Divider(),
            Text('F. NUMBER  : ${entry.formattedNumber}', style: mono),
            Text('C.M. NUMBER: ${entry.cachedMatchedNumber}', style: mono),
            Text('NUMBER     : ${entry.number}', style: mono),
            Text('NAME       : ${entry.name}', style: mono),
            Text('TYPE       : ${entry.callType}', style: mono),
            Text(
                'DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}',
                style: mono),
            Text('DURATION   : ${entry.duration}', style: mono),
            Text('ACCOUNT ID : ${entry.phoneAccountId}', style: mono),
            Text('SIM NAME   : ${entry.simDisplayName}', style: mono),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Log'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: watoi.length,
                  itemBuilder: (context, index) {
                    return watoi[index];
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
