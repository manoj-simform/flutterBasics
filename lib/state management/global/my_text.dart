import 'package:flutter/material.dart';

_MyTextState? state;

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  State<MyText> createState() {
    state = _MyTextState();
    return state!;
  }
}

class _MyTextState extends State<MyText> {
  double value = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
    );
  }
}
