import 'package:basic_widget/data.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int selectedIndex = 0;
  String title = 'Bottom Navigation Bar Example';

  List<Widget> bodyItems = <Widget>[
    ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Text(
              fruitList[index],
              style: const TextStyle(fontSize: 26.0),
            ),
          ),
        );
      },
      itemCount: fruitList.length,
    ),
    const Text('This is business'),
    const Text('This is school'),
  ];

  List<AppBar> appBarItem = <AppBar>[
    AppBar(
      title: const Text('Home Tab'),
    ),
    AppBar(
      title: const Text('Business Tab'),
    ),
    AppBar(
      title: const Text('School Tab'),
    ),
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: Colors.deepOrange,
      ),
      body: bodyItems[selectedIndex],
    );
  }
}
