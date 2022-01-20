import 'package:flutter/material.dart';

import '../demo_screen.dart';
import '../transitions/size_route.dart';

class SizeScreen extends StatelessWidget {
  const SizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: const Text('Size Transition'),
          onPressed: () => Navigator.push(
              context, SizeRoute(page: const DemoScreen())),
        ),
      ),
    );
  }
}
