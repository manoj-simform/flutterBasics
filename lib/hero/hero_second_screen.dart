import 'package:flutter/material.dart';

class HeroSecondScreen extends StatelessWidget {
  const HeroSecondScreen({
    Key? key,
    required this.url,
    required this.index,
  }) : super(key: key);

  final String url, index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'mainImage$index',
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
