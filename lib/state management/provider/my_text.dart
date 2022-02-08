import 'package:basic_widget/state%20management/provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Helper>(
      builder: (context, helper, _) => Text(
        helper.updateValue.toString(),
      ),
    );
  }
}
