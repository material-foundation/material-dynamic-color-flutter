import 'package:dynamic_colors/dynamic_colors_plugin.dart';
import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getCorePalette', () async {
    CorePalette sampleColors = generateCorePalette((i) => i);
    DynamicColorsTestingUtils.setMockDynamicColors(sampleColors);

    final colors = await DynamicColorsPlugin.getCorePalette();
    expect(colors, equals(sampleColors));
  });

  test('getCorePalette returns null', () async {
    DynamicColorsTestingUtils.setMockDynamicColors(null);

    final colors = await DynamicColorsPlugin.getCorePalette();
    expect(colors, equals(null));
  });
}
