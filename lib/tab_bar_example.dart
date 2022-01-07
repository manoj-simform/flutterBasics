import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    color: Colors.deepOrange,
                    child: Text(
                      'Tab One $index',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              },
              itemCount: 100,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    color: Colors.yellow,
                    child: Text(
                      'Tab Two $index',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              },
              itemCount: 100,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    color: Colors.green,
                    child: Text(
                      'Tab Three $index',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              },
              itemCount: 100,
            ),
          ],
        ),
      ),
    );
  }
}
