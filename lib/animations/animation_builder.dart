import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilderExample extends StatefulWidget {
  const AnimationBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimationBuilderExample> createState() =>
      _AnimationBuilderExampleState();
}

class _AnimationBuilderExampleState
    extends State<AnimationBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          isSelect = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isSelect = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Builder'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightBlueAccent,
            child: Center(
              child: TextButton(
                child: const Text('Rotate'),
                onPressed: () {
                  isSelect ? controller.reset() : controller.repeat();
                },
              ),
            ),
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: controller.value * 2 * pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
