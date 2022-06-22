import 'package:flutter/material.dart';

import 'color_filter_generator.dart';

class ImageFilter extends StatelessWidget {
  const ImageFilter({
    Key? key,
    required this.brightness,
    required this.saturation,
    required this.scale,
    required this.child,
    required this.contrast,
    required this.redRotation,
    required this.greenRotation,
    required this.blueRotation,
  }) : super(key: key);

  final double brightness,
      saturation,
      scale,
      redRotation,
      greenRotation,
      blueRotation;
  final int contrast;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(
        ColorFilterGenerator.brightnessAdjustMatrix(
          value: brightness,
        ),
      ),
      child: ColorFiltered(
        colorFilter: ColorFilter.matrix(
          ColorFilterGenerator.setSaturation(saturation / 255),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(
            ColorFilterGenerator.setScale(scale / 255),
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.matrix(
              ColorFilterGenerator.contrastAdjustMatrix(
                value: contrast,
              ),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                ColorFilterGenerator.setRotate(0, redRotation),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(
                  ColorFilterGenerator.setRotate(1, greenRotation),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(
                    ColorFilterGenerator.setRotate(2, blueRotation),
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
