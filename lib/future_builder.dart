import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  _FutureBuilderExampleState createState() =>
      _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  Future<String> data() async {
    return Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => 'Coming after 3 Second');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String>(
            future: data(),
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Text(snapshot.data),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          FutureBuilder<String>(
            future: data(),
            initialData: 'This is initial data',
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Text(snapshot.data),
                );
              }
              return Text(
                snapshot.data,
              );
            },
          ),
        ],
      ),
    );
  }
}
