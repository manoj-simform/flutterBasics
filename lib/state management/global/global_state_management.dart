import 'package:flutter/material.dart';

import 'my_slider.dart';
import 'my_text.dart';

class GlobalStateManagement extends StatelessWidget {
  const GlobalStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global State Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          MyText(),
          MySlider(),
        ],
      ),
    );
  }
}
