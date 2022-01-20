import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);
  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: 30.0, vertical: 10.0),
        children: [
          CustomTextField(
            onChange: (text) {
              name = text;
            },
            obscureText: true,
            autoFocus: true,
            inputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'This is obscure text example',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              labelText: "Secret",
              helperText: "8 Characters only",
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextField(
            onChange: (text) {
              name = text;
            },
            keyboardType: TextInputType.number,
            inputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              suffixIcon: Icon(Icons.call),
              hintText: 'This is phone example',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextField(
            onChange: (text) {
              name = text;
            },
            keyboardType: TextInputType.emailAddress,
            inputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'This is email example',
              suffixText: "@gmail.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextField(
            onChange: (text) {
              name = text;
            },
            keyboardType: TextInputType.multiline,
            maxLine: 5,
            inputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.home),
              hintText: 'address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Function(String) onChange;
  final bool obscureText;
  final bool autoFocus;
  final TextInputType keyboardType;
  final InputDecoration? inputDecoration;
  final int maxLine;
  const CustomTextField(
      {Key? key,
      required this.onChange,
      this.obscureText = false,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.inputDecoration,
      this.maxLine = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      obscureText: obscureText,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      decoration: inputDecoration,
      maxLines: maxLine,
    );
  }
}
