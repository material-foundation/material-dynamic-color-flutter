import 'dart:ui';

import 'package:dynamic_colors/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO(guidezpl): finish tests when monet is available
  group('Color harmonization', () {
    test('white with black', () async {
      Color colorA = const Color(0xFFFFFFFF);
      Color colorB = const Color(0x00000000);

      int harmonizedColor = harmonizeColor(colorA, colorB);
      expect(harmonizedColor, equals(12345));
    });

    test('same color', () async {
      Color colorA = const Color(0xFFFFFFFF);

      int harmonizedColor = harmonizeColor(colorA, colorA);
      expect(harmonizedColor, equals(colorA.value));
    });
  });

  group('ColorScheme harmonization', () {
    test('with default scheme', () async {
      ColorScheme colorScheme = const ColorScheme.light();
      ColorScheme harmonizedColorScheme = colorScheme;
      expect(colorScheme.harmonized(), harmonizedColorScheme);
    });

    test('with different primary color', () async {
      ColorScheme colorScheme = const ColorScheme.light().copyWith(
        primary: Colors.amber,
      );
      ColorScheme harmonizedColorScheme = colorScheme;

      expect(colorScheme.harmonized(), harmonizedColorScheme);
    });

    test('with different primary and error colors', () async {
      ColorScheme colorScheme = const ColorScheme.light().copyWith(
        primary: Colors.amber,
        error: Colors.blue,
      );
      ColorScheme harmonizedColorScheme = colorScheme;

      expect(colorScheme.harmonized(), harmonizedColorScheme);
    });

    test('with different colors being harmonized', () async {
      ColorScheme colorScheme = const ColorScheme.light().copyWith(
        primary: Colors.amber,
        error: Colors.blue,
      );
      ColorScheme harmonizedColorScheme = colorScheme;

      expect(
          colorScheme.harmonized(
            error: false,
            onError: false,
            secondary: true,
            onSecondary: true,
          ),
          harmonizedColorScheme);
    });
  });
}
