import 'dart:developer';

import 'package:flutter/material.dart';

class HelperWidgetExample extends StatelessWidget {
  const HelperWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helper Widget Example'),
      ),
      body: ListView(
        children: [
          const Card(
            child: Text(
              'Expanded Example',
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
          const Card(
            child: Text(
              'Flexible Example',
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.amber,
                    width: 100.0,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
          const Card(
            child: Text(
              'Align Example',
              textScaleFactor: 2.0,
            ),
          ),
          const SizedBox(
            height: 200.0,
            child: ColoredBox(
              color: Colors.amber,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox.square(
                  dimension: 100.0,
                  child: ColoredBox(color: Colors.redAccent),
                ),
              ),
            ),
          ),
          const Card(
            child: Text(
              'Spacer Example',
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Row(
              children: [
                const Spacer(),
                Container(
                  height: double.infinity,
                  color: Colors.lightGreenAccent,
                  child: const Text(
                    'This is text',
                    textScaleFactor: 2.0,
                  ),
                ),
              ],
            ),
          ),
          const Card(
            child: Text(
              'Wrap Example',
              textScaleFactor: 2.0,
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Wrap(
              // spacing: 30.0,
              // runSpacing: 10.0,
              // runAlignment: WrapAlignment.center,
              // alignment: WrapAlignment.end,
              // direction: Axis.vertical,
              children: const [
                Text(
                  'hello',
                  textScaleFactor: 3.0,
                ),
                Text(
                  'Manoj',
                  textScaleFactor: 3.0,
                ),
                Text(
                  'hello',
                  textScaleFactor: 3.0,
                ),
                Text(
                  'Manoj',
                  textScaleFactor: 3.0,
                ),
                Text(
                  'hello',
                  textScaleFactor: 3.0,
                ),
                Text(
                  'Manoj',
                  textScaleFactor: 3.0,
                ),
              ],
            ),
          ),
          const Card(
            child: Text(
              'GestureDetector Example',
              textScaleFactor: 2.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              log('clicked');
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: const Text('Gesture Detector'),
            ),
          ),
          const Card(
            child: Text(
              'ClipRRect Example',
              textScaleFactor: 2.0,
            ),
          ),
          Center(
            child: SizedBox(
              height: 200.0,
              child: ClipRRect(
                child: Image.asset('assets/image-1.jpg'),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
