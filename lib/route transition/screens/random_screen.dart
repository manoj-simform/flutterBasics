import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/enter_exit_route.dart';
import '../transitions/scale_rotate_route.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

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
              child: const Text('Enter Exit Slide Transition'),
              onPressed: () => Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: this, enterPage: const DemoScreen())),
            ),
            ElevatedButton(
              child: const Text('Scale Rotate Transition'),
              onPressed: () => Navigator.push(context,
                  ScaleRotateRoute(page: const DemoScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
