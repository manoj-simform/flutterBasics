import 'package:flutter/cupertino.dart';

var myDataList = [
  'column',
  'row',
  'textField',
  'button',
  'image',
  'stack',
  'data file',
  'bottom navigation bar',
];

var fruitList = List.generate(10, (index) => 'Fruit $index');

var mainAxisList = <Text, MainAxisAlignment>{
  const Text('center'): MainAxisAlignment.center,
  const Text('end'): MainAxisAlignment.end,
  const Text('spaceAround'): MainAxisAlignment.spaceAround,
  const Text('spaceBetween'): MainAxisAlignment.spaceBetween,
  const Text('spaceEvenly'): MainAxisAlignment.spaceEvenly,
  const Text('start'): MainAxisAlignment.start,
};

var crossAxisList = <Text, CrossAxisAlignment>{
  const Text('center'): CrossAxisAlignment.center,
  const Text('end'): CrossAxisAlignment.end,
  const Text('start'): CrossAxisAlignment.start,
  const Text('stretch'): CrossAxisAlignment.stretch,
};

var alignmentList = <Text, Alignment>{
  const Text('Top Left'): Alignment.topLeft,
  const Text('Top Center'): Alignment.topCenter,
  const Text('Top Right'): Alignment.topRight,
  const Text('Center Left'): Alignment.centerLeft,
  const Text('Center'): Alignment.center,
  const Text('Center Right'): Alignment.centerRight,
  const Text('Bottom Left'): Alignment.bottomLeft,
  const Text('Bottom Center'): Alignment.bottomCenter,
  const Text('Bottom Right'): Alignment.bottomRight,
};
