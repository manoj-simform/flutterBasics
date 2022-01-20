import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/scale_route.dart';

class ScaleScreen extends StatelessWidget {
  const ScaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: const Text('ScaleTransition'),
          onPressed: () => Navigator.push(
              context, ScaleRoute(page: const DemoScreen())),
        ),
      ),
    );
  }
}
