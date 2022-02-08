import 'package:flutter/material.dart';

import 'my_text.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double value = 10;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: (val) {
        setState(() {
          value = val;
        });
        state!.setState(() {
          state!.value = val;
        });
      },
      min: 10.0,
      max: 100.0,
    );
  }
}
