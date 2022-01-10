import 'dart:math' as math;

import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Example'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            color:
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
          );
        },
        addAutomaticKeepAlives: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        cacheExtent: 10,
      ),
    );
  }
}
