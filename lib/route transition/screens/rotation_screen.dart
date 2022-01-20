import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/rotation_route.dart';

class RotationScreen extends StatelessWidget {
  const RotationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: const Text('Rotation Transition'),
          onPressed: () => Navigator.push(
              context, RotationRoute(page: const DemoScreen())),
        ),
      ),
    );
  }
}
