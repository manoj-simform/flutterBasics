import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DataFileExample extends StatefulWidget {
  const DataFileExample({Key? key}) : super(key: key);

  @override
  _DataFileExampleState createState() => _DataFileExampleState();
}

class _DataFileExampleState extends State<DataFileExample> {
  String value = "No data";
  String? textValue;

  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode n1 = FocusNode();

  Future<String> get filePath async {
    final document = await getApplicationDocumentsDirectory();
    return document.path;
  }

  Future<File> get fileDoc async {
    final localFile = await filePath;
    return File('$localFile/db.txt');
  }

  Future<String> read() async {
    try {
      final file = await fileDoc;
      log(file.path);
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "No data found";
    }
  }

  Future<File> write(String data) async {
    final file = await fileDoc;
    String fileData = await read();
    return file.writeAsString('$fileData \n $data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data File Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(child: Text(value)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Data',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue, width: 3.0),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red, width: 3.0),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "Data",
                    ),
                    focusNode: n1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await write(controller.text);
                      setState(() {
                        controller.text = "";
                        n1.unfocus();
                      });
                    }
                  },
                  child: const Text("Store Data in File"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    read().then((txt) {
                      setState(() {
                        value = txt;
                      });
                    });
                  },
                  child: const Text("Read Data from File"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
