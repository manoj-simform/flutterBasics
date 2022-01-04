import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class StackExample extends StatefulWidget {
  const StackExample({Key? key}) : super(key: key);

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  Alignment alignmentSelected = Alignment.topLeft;
  List<Text> alignmentPickerItems = alignmentList.keys.toList();

  CupertinoPicker alignmentIOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          alignmentSelected =
              alignmentList.values.elementAt(selectedIndex);
        });
      },
      children: alignmentPickerItems,
    );
  }

  DropdownButton androidAlignmentDropdown() {
    List<DropdownMenuItem> dropdownItems = [];
    for (int i = 0; i < alignmentList.keys.length; i++) {
      var newItem = DropdownMenuItem(
        child: alignmentList.keys.elementAt(i),
        value: alignmentList.values.elementAt(i),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: alignmentSelected,
      onChanged: (value) {
        setState(() {
          alignmentSelected = value;
        });
      },
      items: dropdownItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: alignmentSelected,
              children: const [
                SizedBox.square(
                  dimension: 300.0,
                  child: ColoredBox(
                    color: Colors.deepOrange,
                  ),
                ),
                SizedBox.square(
                  dimension: 200.0,
                  child: ColoredBox(
                    color: Colors.teal,
                  ),
                ),
                SizedBox.square(
                  dimension: 100.0,
                  child: ColoredBox(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            color: Colors.lightBlue,
            child: Column(
              children: [
                const Text(
                  "Stack Alignment",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Platform.isIOS
                    ? alignmentIOSPicker()
                    : androidAlignmentDropdown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
