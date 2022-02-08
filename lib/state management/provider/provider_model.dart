import 'package:basic_widget/state%20management/provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_slider.dart';
import 'my_text.dart';

class ProviderModel extends StatelessWidget {
  const ProviderModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Helper>(
      create: (context) => Helper(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Model Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyText(),
            MySlider(),
          ],
        ),
      ),
    );
  }
}
