import 'package:dynamic_colors/dynamic_colors_builder.dart';
import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DynamicColorsBuilder', (WidgetTester tester) async {
    CorePalette samplePalette = generateCorePalette((i) => 12345);
    DynamicColorsTestingUtils.setMockDynamicColors(samplePalette);

    const containerKey = Key('myContainer');

    await tester.pumpWidget(
      DynamicColorsBuilder(
        builder: (CorePalette? corePalette) {
          return Container(
            key: containerKey,
            color: corePalette?.primary.tone99,
          );
        },
      ),
    );

    await tester.pumpAndSettle();

    expect(
      (tester.firstWidget(find.byKey(containerKey)) as Container).color,
      const Color(0x00003039), // 12345 in hex
    );
  });
}
