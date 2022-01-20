import 'package:basic_widget/hero/hero_second_screen.dart';
import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  HeroExample({Key? key}) : super(key: key);
  final images = [
    'https://images.unsplash.com/photo-1642609026498-a1b68d50601f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=60',
    'https://images.unsplash.com/photo-1642478862237-3eafc24f32b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=60',
    'https://images.unsplash.com/photo-1642609881805-c8b7b54d97b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=60',
    'https://images.unsplash.com/photo-1642608284312-f84c6d942bc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MXx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=60',
    'https://images.unsplash.com/photo-1642602893412-ad503b7a903a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=60',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Widget Example'),
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroSecondScreen(
                    url: images[index],
                    index: index.toString(),
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'mainImage$index',
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
