import 'package:flutter/material.dart';

class TableViewExample extends StatelessWidget {
  const TableViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableView Example'),
      ),
      body: Table(
        textDirection: TextDirection.rtl,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(width: 2.0, color: Colors.black),
        children: const [
          TableRow(children: [
            Text(
              "Education",
              textScaleFactor: 1.5,
            ),
            Text("Institution name", textScaleFactor: 1.5),
            Text("University", textScaleFactor: 1.5),
          ]),
          TableRow(children: [
            Text("B.Tech", textScaleFactor: 1.5),
            Text("Depstar", textScaleFactor: 1.5),
            Text("Charusat", textScaleFactor: 1.5),
          ]),
          TableRow(children: [
            Text("Diploma in CE", textScaleFactor: 1.5),
            Text("Om Institute", textScaleFactor: 1.5),
            Text("GTU", textScaleFactor: 1.5),
          ]),
          TableRow(children: [
            Text("High School", textScaleFactor: 1.5),
            Text("Vivekananda Vidhyalay", textScaleFactor: 1.5),
            Text("GSEB", textScaleFactor: 1.5),
          ]),
        ],
      ),
    );
  }
}
