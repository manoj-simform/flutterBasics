import 'package:flutter/material.dart';

class BottomSheetDialogExample extends StatefulWidget {
  const BottomSheetDialogExample({Key? key}) : super(key: key);

  @override
  _BottomSheetDialogExampleState createState() =>
      _BottomSheetDialogExampleState();
}

class _BottomSheetDialogExampleState
    extends State<BottomSheetDialogExample> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet & Dialog Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            onChanged: (value) {
                              data = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter message',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(25.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 3.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(25.0)),
                              ),
                              labelText: "Message",
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    alignment: Alignment.center,
                                    title: Center(
                                      child: Text(data!),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text('Send'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.arrow_upward_sharp),
      ),
      body: Center(
        child: TextButton(
          child: const Text(
            'Simple Dialog',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            showDialog(
              builder: (BuildContext context) {
                return const SimpleDialog(
                  title: Text(
                    'Simple Dialog Example',
                  ),
                  children: [
                    SimpleDialogOption(
                      child: Text('Option 1'),
                    ),
                    SimpleDialogOption(
                      child: Text('Option 2'),
                    ),
                    SimpleDialogOption(
                      child: Text('Option 3'),
                    ),
                    SimpleDialogOption(
                      child: Text('Option 4'),
                    ),
                    SimpleDialogOption(
                      child: Text('Option 5'),
                    ),
                  ],
                );
              },
              context: context,
            );
          },
        ),
      ),
    );
  }
}
