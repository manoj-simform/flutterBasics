import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/fade_route.dart';

class FadeScreen extends StatelessWidget {
  const FadeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: const Text('Fade Transition'),
          onPressed: () => Navigator.push(
              context, FadeRoute(page: const DemoScreen())),
        ),
      ),
    );
  }
}
