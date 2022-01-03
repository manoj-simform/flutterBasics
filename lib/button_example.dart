import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Example'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              child: const Text(
                'I am TextButton',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
            ),
            ClipOval(
              child: TextButton(
                child: const Text(
                  'ClipOval Button',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('I am Elevated Button'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('I am Elevated Rounded Button'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.red, width: 3.0),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.touch_app_outlined,
              ),
              iconSize: 50.0,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.touch_app_outlined,
                size: 50.0,
              ),
              label: const Text(
                'This is Text Icon Button',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
