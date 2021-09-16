import 'package:dynamic_colors/dynamic_colors_plugin.dart';
import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getDynamicColors', () async {
    KeyPalettes sampleColors = generateKeyPalettes((i) => i);
    DynamicColorsTestingUtils.setMockDynamicColors(sampleColors);

    final colors = await DynamicColorsPlugin.getDynamicColors();
    expect(colors, equals(sampleColors));
  });

  test('getDynamicColors returns null', () async {
    DynamicColorsTestingUtils.setMockDynamicColors(null);

    final colors = await DynamicColorsPlugin.getDynamicColors();
    expect(colors, equals(null));
  });
}
