import 'package:basic_widget/button_example.dart';
import 'package:basic_widget/data.dart';
import 'package:basic_widget/image_example.dart';
import 'package:basic_widget/row_example.dart';
import 'package:basic_widget/stack_example.dart';
import 'package:basic_widget/tab_bar_example.dart';
import 'package:basic_widget/text_field_example.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';
import 'column_example.dart';
import 'datafile_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/column': (context) => const ColumnExample(),
        '/row': (context) => const RowExample(),
        '/textField': (context) => const TextFieldExample(),
        '/button': (context) => const ButtonExample(),
        '/image': (context) => const ImageExample(),
        '/stack': (context) => const StackExample(),
        '/data file': (context) => const DataFileExample(),
        '/bottom navigation bar': (context) =>
            const BottomNavigationBarExample(),
        '/tab bar': (context) => const TabBarExample(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Widget Example"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/${myDataList[index]}");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Text(
                  myDataList[index],
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: myDataList.length,
      ),
    );
  }
}
