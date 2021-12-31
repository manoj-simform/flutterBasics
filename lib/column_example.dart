import 'dart:io';

import 'package:basic_widget/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnExample extends StatefulWidget {
  const ColumnExample({Key? key}) : super(key: key);

  @override
  State<ColumnExample> createState() => _ColumnExampleState();
}

class _ColumnExampleState extends State<ColumnExample> {
  MainAxisAlignment mainAxisSelected = MainAxisAlignment.center;
  CrossAxisAlignment crossAxisSelected = CrossAxisAlignment.center;

  List<Text> mainPickerItems = mainAxisList.keys.toList();
  List<Text> crossPickerItems = crossAxisList.keys.toList();

  CupertinoPicker mainIOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          mainAxisSelected = mainAxisList.values.elementAt(selectedIndex);
        });
      },
      children: mainPickerItems,
    );
  }

  CupertinoPicker crossIOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          crossAxisSelected = crossAxisList.values.elementAt(selectedIndex);
        });
      },
      children: crossPickerItems,
    );
  }

  DropdownButton androidMainDropdown() {
    List<DropdownMenuItem> dropdownItems = [];
    for (int i = 0; i < mainAxisList.keys.length; i++) {
      var newItem = DropdownMenuItem(
        child: mainAxisList.keys.elementAt(i),
        value: mainAxisList.values.elementAt(i),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: mainAxisSelected,
      onChanged: (value) {
        setState(() {
          mainAxisSelected = value;
        });
      },
      items: dropdownItems,
    );
  }

  DropdownButton androidCrossDropdown() {
    List<DropdownMenuItem> dropdownItems = [];
    for (int i = 0; i < crossAxisList.keys.length; i++) {
      var newItem = DropdownMenuItem(
        child: crossAxisList.keys.elementAt(i),
        value: crossAxisList.values.elementAt(i),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: crossAxisSelected,
      onChanged: (value) {
        setState(() {
          crossAxisSelected = value;
        });
      },
      items: dropdownItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: mainAxisSelected,
              crossAxisAlignment: crossAxisSelected,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.amber,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.red,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            color: Colors.lightBlue,
            child: Column(
              children: [
                const Text(
                  "Main Axis Alignment",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Platform.isIOS ? mainIOSPicker() : androidMainDropdown(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            color: Colors.lightBlue,
            child: Column(
              children: [
                const Text(
                  "Cross Axis Alignment",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Platform.isIOS ? crossIOSPicker() : androidCrossDropdown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
