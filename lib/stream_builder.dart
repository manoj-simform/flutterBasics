import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  _StreamBuilderExampleState createState() =>
      _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  bool isPaused = false;
  int value = 1;

  late StreamController<int> streamController;
  late StreamSubscription<int> streamSubscription;

  Stream<int> count() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) => value++,
    );
  }

  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    streamSubscription = count().listen((event) {
      streamController.add(event);
    });
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
              setState(() {
                isPaused = !isPaused;
              });
              if (isPaused) {
                streamSubscription.pause();
              } else {
                streamSubscription.resume();
              }
            },
            child: Text(isPaused ? 'Resume' : 'Pause'),
          ),
        ],
      ),
    );
  }
}
