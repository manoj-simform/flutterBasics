import 'dart:developer';

import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter/material.dart';

class ExtensionExample extends StatefulWidget {
  const ExtensionExample({Key? key}) : super(key: key);

  @override
  State<ExtensionExample> createState() => _ExtensionExampleState();
}

class _ExtensionExampleState extends State<ExtensionExample> {
  static bool isPrimaryColor = true;
  @override
  Widget build(BuildContext context) {
    SelectedColor selectedColor =
        getRandomSelectedColor(isPrimaryColor);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isPrimaryColor = !isPrimaryColor;
                log(selectedColor.color().toString());
              });
            },
            child: Text(
              selectedColor.displayColorChangeText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(() {
            switch (selectedColor) {
              case SelectedColor.primaryColor:
                return 'This is the Primary Color';
              case SelectedColor.secondaryColor:
                return 'This is the Secondary Color';
              default:
                return 'SelectedScheme Title is null';
            }
          }()),
          Text(() {
            switch (selectedColor) {
              case SelectedColor.primaryColor:
                return 'This is the Primary Color';
              case SelectedColor.secondaryColor:
                return 'This is the Secondary Color';
              default:
                return 'SelectedScheme Title is null';
            }
          }()),
          Text(selectedColor.displayTitle),
          Text(selectedColor.name),
        ],
      ),
    );
  }
}

enum SelectedColor {
  primaryColor,
  secondaryColor,
}

extension SelectedColorExtension on SelectedColor {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case SelectedColor.primaryColor:
        return 'This is the Primary Color';
      case SelectedColor.secondaryColor:
        return 'This is the Secondary Color';
      default:
        return 'SelectedScheme Title is null';
    }
  }

  String get displayColorChangeText {
    switch (this) {
      case SelectedColor.primaryColor:
        return 'Change to Secondary Color';
      case SelectedColor.secondaryColor:
        return 'Change to Primary Color';
      default:
        return 'SelectedScheme is null';
    }
  }

  Color color() {
    switch (this) {
      case SelectedColor.primaryColor:
        return Colors.red;
      case SelectedColor.secondaryColor:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }
}

SelectedColor getRandomSelectedColor(bool isPrimary) {
  switch (isPrimary) {
    case true:
      return SelectedColor.primaryColor;
    case false:
      return SelectedColor.secondaryColor;
    default:
      return SelectedColor.primaryColor;
  }
}
