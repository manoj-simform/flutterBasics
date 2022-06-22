import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_filter_widget.dart';

class ImageManipulation extends StatefulWidget {
  const ImageManipulation({Key? key}) : super(key: key);

  @override
  State<ImageManipulation> createState() => _ImageManipulationState();
}

class _ImageManipulationState extends State<ImageManipulation> {
  Image image = Image.asset('assets/colorful_flower.png');
  final picker = ImagePicker();
  double scale = 255,
      brightness = 0,
      saturation = 255,
      contrast = 0,
      redRotation = 0,
      greenRotation = 0,
      blueRotation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Manipulation Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image == null)
              ElevatedButton(
                onPressed: () async {
                  final res =
                      await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    // image = File(res!.path);
                    image = image;
                  });
                },
                child: const Text('Pick Image'),
              )
            else
              ImageFilter(
                scale: scale,
                brightness: brightness,
                saturation: saturation,
                contrast: contrast.round(),
                child: image,
                redRotation: redRotation,
                greenRotation: greenRotation,
                blueRotation: blueRotation,
              ),
            if (image != null)
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Scale'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: scale,
                          onChanged: (val) => setState(() {
                            scale = val;
                          }),
                          min: 0,
                          max: 510,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Saturation'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: saturation,
                          onChanged: (val) => setState(() {
                            saturation = val;
                          }),
                          min: 0,
                          max: 510,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Brightness'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: brightness,
                          onChanged: (val) => setState(() {
                            brightness = val;
                          }),
                          min: -1.0,
                          max: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Contrast'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: contrast,
                          onChanged: (val) => setState(() {
                            contrast = val;
                          }),
                          min: -100,
                          max: 100,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Rotation Red'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: redRotation,
                          onChanged: (val) => setState(() {
                            redRotation = val;
                          }),
                          min: 0,
                          max: 360,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Rotation Green'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: greenRotation,
                          onChanged: (val) => setState(() {
                            greenRotation = val;
                          }),
                          min: 0,
                          max: 360,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Rotation Blue'),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Slider(
                          value: blueRotation,
                          onChanged: (val) => setState(() {
                            blueRotation = val;
                          }),
                          min: 0,
                          max: 360,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() {
                          image = image;
                          scale = 255;
                          brightness = 0;
                          saturation = 255;
                          contrast = 0;
                          redRotation = 0;
                          greenRotation = 0;
                          blueRotation = 0;
                        }),
                        child: const Text('Clear Image'),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          scale = 255;
                          brightness = 0;
                          saturation = 255;
                          contrast = 0;
                          redRotation = 0;
                          greenRotation = 0;
                          blueRotation = 0;
                        }),
                        child: const Text('Reset Value'),
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
