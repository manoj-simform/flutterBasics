import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/SlideScreen.dart';
import 'screens/fade_screen.dart';
import 'screens/random_screen.dart';
import 'screens/rotation_screen.dart';
import 'screens/scale_screen.dart';
import 'screens/size_screen.dart';

class RouteTransitionExample extends StatelessWidget {
  static Map<String, Widget> screens = {
    'Slide Transition': const SlideScreen(),
    'Scale Transition': const ScaleScreen(),
    'Rotation Transition': const RotationScreen(),
    'Size Transition': const SizeScreen(),
    'Fade Transition': const FadeScreen(),
    'Random': const RandomScreen(),
  };

  const RouteTransitionExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Transition Example'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buttons(context),
        ),
      ),
    );
  }

  List<ElevatedButton> buttons(context) {
    List<ElevatedButton> buttons = [];
    screens.forEach(
      (k, v) => buttons.add(
        ElevatedButton(
          child: Text(k),
          onPressed: () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => v)),
        ),
      ),
    );
    return buttons;
  }
}
