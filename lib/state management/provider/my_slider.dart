import 'package:basic_widget/state%20management/provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<Helper>(context);
    return Slider(
      value: helper.updateValue,
      onChanged: (val) => helper.updateValue = val,
      min: 10.0,
      max: 100.0,
    );
  }
}
