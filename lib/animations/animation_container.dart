import 'dart:math';

import 'package:flutter/material.dart';

class AnimationContainerExample extends StatefulWidget {
  const AnimationContainerExample({Key? key}) : super(key: key);

  @override
  State<AnimationContainerExample> createState() =>
      _AnimationContainerExampleState();
}

class _AnimationContainerExampleState
    extends State<AnimationContainerExample> {
  double width = 200;
  double margin = 0;
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: color,
        width: width,
        margin: EdgeInsets.all(margin),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                margin += 10;
                setState(() {});
              },
              child: const Text('Animate Margin'),
            ),
            ElevatedButton(
              onPressed: () {
                width += width * .05;
                setState(() {});
              },
              child: const Text('Animate Width'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Color(Random().nextInt(0xffffffff))
                    .withAlpha(0xff);
                setState(() {});
              },
              child: const Text('Animate Color'),
            ),
          ],
        ),
      ),
    );
  }
}
