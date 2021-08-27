import 'dart:typed_data';

import 'package:dynamic_colors/dynamic_colors_plugin.dart';
import 'package:dynamic_colors/tonal_palette.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getDynamicColors', () async {
    TonalPalette sampleColors =
        TonalPalette.fromList(List<int>.generate(13 * 5, (i) => i % 13));
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

/// Static methods used for testing apps with dynamic [TonalPalette]s.
class DynamicColorsTestingUtils {
  /// Initializes the dynamic colors plugin with mock values for testing.
  @visibleForTesting
  static void setMockDynamicColors(TonalPalette? colors) {
    DynamicColorsPlugin.channel
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == DynamicColorsPlugin.methodName) {
        return colors != null ? Int32List.fromList(colors.asList()) : null;
      }
    });
    addTearDown(() {
      DynamicColorsPlugin.channel.setMockMethodCallHandler(null);
    });
  }
}
