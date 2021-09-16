import 'dart:ui';

import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KeyPalettes', () {
    test('fromList and asList', () {
      List<int> ints =
          List.generate(KeyPalettes.size * KeyPalette.size, (i) => i);
      KeyPalettes keyPalettes = KeyPalettes.fromList(ints);
      expect(keyPalettes.asList(), ints);
    });
  });

  group('KeyPalette', () {
    test('fromList and asList', () {
      List<int> ints = List.generate(KeyPalette.size, (i) => i);
      KeyPalette keyPalette = KeyPalette.fromList(ints);
      expect(keyPalette.allTones, ints.map((i) => Color(i)));
    });
  });
}
