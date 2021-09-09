import 'dart:ui';

import 'package:dynamic_colors/tonal_palette.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TonalPalette', () {
    test('fromList and asList', () {
      List<int> ints =
          List.generate(TonalPalette.size * TonalRange.size, (i) => i);
      TonalPalette tonalPalette = TonalPalette.fromList(ints);
      expect(tonalPalette.asList(), ints);
    });
  });

  group('TonalRange', () {
    test('fromList and asList', () {
      List<int> ints = List.generate(TonalRange.size, (i) => i);
      TonalRange tonalRange = TonalRange.fromList(ints);
      expect(tonalRange.allShades, ints.map((i) => Color(i)));
    });
  });
}
