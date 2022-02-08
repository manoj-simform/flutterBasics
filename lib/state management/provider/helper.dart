import 'package:flutter/material.dart';

class Helper extends ChangeNotifier {
  double value = 10.0;

  double get updateValue => value;

  set updateValue(double val) {
    value = val;
    notifyListeners();
  }
}
