import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  _StreamBuilderExampleState createState() =>
      _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  int value = 0;

  StreamController<int> streamController = StreamController();
  late StreamSubscription<int> streamSubscription;

  Stream<int> count() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) => ++value,
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: streamController.stream,
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState ==
                      ConnectionState.active &&
                  snapshot.hasData) {
                return Center(
                  child: Text(
                    snapshot.data.toString(),
                  ),
                );
              } else if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: Text('Getting Data'),
                );
              } else {
                return const Center(
                  child: Text('No Data'),
                );
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () {
              streamSubscription = count().listen((event) {
                streamController.add(event);
                streamController.onPause!();
              });
            },
            child: const Text('Listen'),
          ),
          TextButton(
            onPressed: () {
              streamSubscription.pause();
            },
            child: const Text('Pause'),
          ),
          TextButton(
            onPressed: () {
              streamSubscription.resume();
            },
            child: const Text('Resume'),
          ),
          TextButton(
            onPressed: () {
              streamSubscription.cancel();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
