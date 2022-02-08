import 'package:flutter/material.dart';

class StateManagementExample extends StatelessWidget {
  const StateManagementExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/globalState');
              },
              child: const Text(
                'Global State Management',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/providerStateManagement');
              },
              child: const Text(
                'Provider State Management',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
