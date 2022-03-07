import 'package:basic_widget/animations/animation_builder.dart';
import 'package:flutter/material.dart';

import 'animation_container.dart';
import 'tween_animation.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const AnimationContainerExample(),
                  ),
                );
              },
              child: const Text('Animation Container'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const TweenAnimationExample(),
                  ),
                );
              },
              child: const Text('Tween Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const AnimationBuilderExample(),
                  ),
                );
              },
              child: const Text('Animation Builder'),
            ),
          ],
        ),
      ),
    );
  }
}
