import 'dart:math';

class ColorFilterGenerator {
  static List<double> hueAdjustMatrix({required double value}) {
    value = value * pi;

    if (value == 0) {
      return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    }

    double cosVal = cos(value);
    double sinVal = sin(value);
    double lumR = 0.213;
    double lumG = 0.715;
    double lumB = 0.072;

    return List<double>.from(<double>[
      (lumR + (cosVal * (1 - lumR))) + (sinVal * (-lumR)),
      (lumG + (cosVal * (-lumG))) + (sinVal * (-lumG)),
      (lumB + (cosVal * (-lumB))) + (sinVal * (1 - lumB)),
      0,
      0,
      (lumR + (cosVal * (-lumR))) + (sinVal * 0.143),
      (lumG + (cosVal * (1 - lumG))) + (sinVal * 0.14),
      (lumB + (cosVal * (-lumB))) + (sinVal * (-0.283)),
      0,
      0,
      (lumR + (cosVal * (-lumR))) + (sinVal * (-(1 - lumR))),
      (lumG + (cosVal * (-lumG))) + (sinVal * lumG),
      (lumB + (cosVal * (1 - lumB))) + (sinVal * lumB),
      0,
      0,
      0,
      0,
      0,
      1,
      0
    ]).map((i) => i.toDouble()).toList();
  }

  static List<double> brightnessAdjustMatrix({required double value}) {
    if (value <= 0) {
      value = value * 255;
    } else {
      value = value * 100;
    }

    if (value == 0) {
      return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    }

    return List<double>.from(<double>[
      1,
      0,
      0,
      0,
      value,
      0,
      1,
      0,
      0,
      value,
      0,
      0,
      1,
      0,
      value,
      0,
      0,
      0,
      1,
      0
    ]).map((i) => i.toDouble()).toList();
  }

  static List<double> setSaturation(double sat) {
    final m = _defaultValue();

    final double invSat = 1 - sat;
    final double R = 0.213 * invSat;
    final double G = 0.715 * invSat;
    final double B = 0.072 * invSat;

    m[0] = R + sat;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + sat;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + sat;

    return m;
  }

  static List<double> setScale(double scale) {
    final m = _emptyValue();

    m[0] = scale;
    m[6] = scale;
    m[12] = scale;
    m[18] = 1;

    return m;
  }

  static List<double> setRotate(int axis, double degrees) {
    final mArray = _defaultValue();
    final radians = degrees * pi / 180;
    final cosine = cos(radians);
    final sine = sin(radians);
    switch (axis) {
      case 0:
        mArray[6] = mArray[12] = cosine;
        mArray[7] = sine;
        mArray[11] = -sine;
        break;
      case 1:
        mArray[0] = mArray[12] = cosine;
        mArray[2] = -sine;
        mArray[10] = sine;
        break;
      case 2:
        mArray[0] = mArray[6] = cosine;
        mArray[1] = sine;
        mArray[5] = -sine;
        break;
    }
    return mArray;
  }

  static List<double> setRGB2YUV() {
    final m = _defaultValue();
    // these coefficients match those in libjpeg
    m[0] = 0.299;
    m[1] = 0.587;
    m[2] = 0.114;
    m[5] = -0.16874;
    m[6] = -0.33126;
    m[7] = 0.5;
    m[10] = 0.5;
    m[11] = -0.41869;
    m[12] = -0.08131;

    return m;
  }

  static List<double> setYUV2RGB() {
    final m = _defaultValue();
    // these coefficients match those in libjpeg
    m[2] = 1.402;
    m[5] = 1;
    m[6] = -0.34414;
    m[7] = -0.71414;
    m[10] = 1;
    m[11] = 1.772;
    m[12] = 0;

    return m;
  }

  static List<double> sharpImage(double sharpness) {
    return [
      0,
      -1,
      0,
      0,
      0,
      -1,
      sharpness,
      -1,
      0,
      0,
      0,
      -1,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0
    ];
  }

  //This is currently not in used
  static List<double> setBinary(double binary) => [
        255,
        0,
        0,
        0,
        (binary - 255) * 255,
        0,
        255,
        0,
        0,
        (binary - 255) * 255,
        0,
        0,
        255,
        0,
        (binary - 255) * 255,
        0,
        0,
        0,
        1,
        0
      ];

  static final List _deltaIndex = [
    0,
    0.01,
    0.02,
    0.04,
    0.05,
    0.06,
    0.07,
    0.08,
    0.1,
    0.11,
    0.12,
    0.14,
    0.15,
    0.16,
    0.17,
    0.18,
    0.20,
    0.21,
    0.22,
    0.24,
    0.25,
    0.27,
    0.28,
    0.30,
    0.32,
    0.34,
    0.36,
    0.38,
    0.40,
    0.42,
    0.44,
    0.46,
    0.48,
    0.5,
    0.53,
    0.56,
    0.59,
    0.62,
    0.65,
    0.68,
    0.71,
    0.74,
    0.77,
    0.80,
    0.83,
    0.86,
    0.89,
    0.92,
    0.95,
    0.98,
    1.0,
    1.06,
    1.12,
    1.18,
    1.24,
    1.30,
    1.36,
    1.42,
    1.48,
    1.54,
    1.60,
    1.66,
    1.72,
    1.78,
    1.84,
    1.90,
    1.96,
    2.0,
    2.12,
    2.25,
    2.37,
    2.50,
    2.62,
    2.75,
    2.87,
    3.0,
    3.2,
    3.4,
    3.6,
    3.8,
    4.0,
    4.3,
    4.7,
    4.9,
    5.0,
    5.5,
    6.0,
    6.5,
    6.8,
    7.0,
    7.3,
    7.5,
    7.8,
    8.0,
    8.4,
    8.7,
    9.0,
    9.4,
    9.6,
    9.8,
    10.0
  ];

  static List<double> contrastAdjustMatrix({required int value}) {
    value = value.clamp(-100, 100);
    if (value == 0) {
      return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    }
    double x;
    if (value < 0) {
      x = 127 + value / 100 * 127;
    } else {
      x = value % 1;
      if (x == 0) {
        x = _deltaIndex[value];
      } else {
        x = _deltaIndex[(value << 0)] * (1 - x) +
            _deltaIndex[(value << 0) + 1] * x;
      }
      x = x * 127 + 127;
    }

    return [
      x / 127,
      0,
      0,
      0,
      0.5 * (127 - x),
      0,
      x / 127,
      0,
      0,
      0.5 * (127 - x),
      0,
      0,
      x / 127,
      0,
      0.5 * (127 - x),
      0,
      0,
      0,
      1,
      0
    ];
  }

  static List<double> _defaultValue() =>
      [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];

  static List<double> _emptyValue() =>
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
}
