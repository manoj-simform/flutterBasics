import 'package:flutter/cupertino.dart';

var myDataList = ['column', 'row', 'textField'];

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
