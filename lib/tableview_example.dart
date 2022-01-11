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
        defaultColumnWidth: const FlexColumnWidth(1.0),
        border: TableBorder.all(
          width: 2.0,
          color: Colors.blue,
          style: BorderStyle.solid,
        ),
        children: [
          TableRow(
            children: [
              customText(
                text: "Education",
              ),
              customText(
                text: "Institution name",
              ),
              customText(
                text: "University",
              ),
            ],
          ),
          TableRow(
            children: [
              customText(
                text: "B.Tech",
              ),
              customText(
                text: "Depstar",
              ),
              customText(
                text: "Charusat",
              ),
            ],
          ),
          TableRow(
            children: [
              customText(
                text: "Diploma in CE",
              ),
              customText(
                text: "Om Institute",
              ),
              customText(
                text: "GTU",
              ),
            ],
          ),
          TableRow(
            children: [
              customText(
                text: "High School",
              ),
              customText(
                text: "Vivekananda Vidhyalay",
              ),
              customText(
                text: "GSEB",
              ),
            ],
          ),
        ],
      ),
    );
  }

  customText({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textScaleFactor: 1.5,
        textAlign: TextAlign.center,
      ),
    );
  }
}
