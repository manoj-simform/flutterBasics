import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Example'),
      ),
      body: ListView(
        children: [
          const Image(
            image: AssetImage('assets/image-1.jpg'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Image.asset(
            "assets/image-2.jpg",
            color: const Color.fromRGBO(255, 255, 255, .7),
            colorBlendMode: BlendMode.modulate,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Image(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1641063157251-ae9d815e5daa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=410&q=80',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/image-3.jpg'),
            radius: 100.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: Image.asset('assets/image-3.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
