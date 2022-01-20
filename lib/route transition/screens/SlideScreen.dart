import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/slide_route.dart';

class SlideScreen extends StatelessWidget {
  const SlideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Slide Right Transition'),
              onPressed: () => Navigator.push(
                  context, SlideRightRoute(page: const DemoScreen())),
            ),
            ElevatedButton(
              child: const Text('Slide Left Transition'),
              onPressed: () => Navigator.push(
                  context, SlideLeftRoute(page: const DemoScreen())),
            ),
            ElevatedButton(
              child: const Text('Slide Top Transition'),
              onPressed: () => Navigator.push(
                  context, SlideTopRoute(page: const DemoScreen())),
            ),
            ElevatedButton(
              child: const Text('Slide Bottom Transition'),
              onPressed: () => Navigator.push(context,
                  SlideBottomRoute(page: const DemoScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
