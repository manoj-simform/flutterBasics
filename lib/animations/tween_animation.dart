import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  State<TweenAnimationExample> createState() =>
      _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation tweenAnimation;
  late Animation<double> curve;

  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    curve =
        CurvedAnimation(parent: controller, curve: Curves.slowMiddle);

    colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.redAccent)
            .animate(curve);

    tweenAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
            tween: Tween<double>(begin: 30, end: 50), weight: 5),
        TweenSequenceItem(
            tween: Tween<double>(begin: 50, end: 30), weight: 5),
      ],
    ).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
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
        title: const Text('Tween Animation'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TweenAnimationBuilder(
              builder: (BuildContext context, double value,
                  Widget? child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              child: const Text(
                'Manoj Padiya',
                style: TextStyle(
                  fontSize: 36.0,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, _) {
                return IconButton(
                  onPressed: () {
                    isSelect
                        ? controller.reverse()
                        : controller.forward();
                  },
                  icon: const Icon(Icons.favorite),
                  iconSize: tweenAnimation.value,
                  color: colorAnimation.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
