import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Example'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            color:
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
            child: Center(
              child: Text(
                'Page ${index + 1}',
                textScaleFactor: 2,
              ),
            ),
          );
        },
        reverse: true,
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          log('Page $index');
        },
        scrollBehavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
        ),
        // pageSnapping: false,
        // dragStartBehavior: DragStartBehavior.down,
        // allowImplicitScrolling: true,
        // padEnds: false,
        // children: <Widget>[
        //   Container(
        //     color: Colors.pink,
        //   ),
        //   Container(
        //     color: Colors.cyan,
        //   ),
        //   Container(
        //     color: Colors.deepPurple,
        //   ),
        // ],
      ),
    );
  }
}
