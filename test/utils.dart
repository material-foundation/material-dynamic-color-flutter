import 'dart:typed_data';

import 'package:dynamic_colors/dynamic_colors_plugin.dart';
import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

/// Generates a [KeyPalettes] based on some generator function which takes an index.
KeyPalettes generateKeyPalettes(int Function(int index) generator) =>
    KeyPalettes.fromList(
      List<int>.generate(KeyPalettes.size * KeyPalette.size, generator),
    );

/// Static methods used for testing apps with dynamic [KeyPalettes]s.
class DynamicColorsTestingUtils {
  /// Initializes the dynamic colors plugin with mock values for testing.
  @visibleForTesting
  static void setMockDynamicColors(KeyPalettes? colors) {
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
