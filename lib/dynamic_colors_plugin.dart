import 'dart:async';

import 'package:flutter/services.dart';

import 'dynamic_colors_builder.dart';
import 'key_palettes.dart';

/// Plugin for obtaining dynamic colors defined by the Android OS.
class DynamicColorsPlugin {
  /// Optional method channel so that it returns null on non-Android platforms.
  static const channel = OptionalMethodChannel(
    'io.material.plugins/dynamic_colors',
  );

  /// The method name that the Kotlin plugin listens for.
  static const methodName = 'getCorePalette';

  /// Returns the Android OS' dynamic colors asynchronously in a [CorePalette].
  ///
  /// Completes with null on pre-Android S and non-Android platforms.
  ///
  /// See also:
  ///
  ///  * [getCorePalette() example](https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/example/lib/get_dynamic_colors_example.dart)
  ///  * [DynamicColorsBuilder] a convenience stateful builder widget that
  ///  provides the dynamic colors
  static Future<CorePalette?> getCorePalette() async {
    final result = await channel.invokeMethod(methodName);
    return result == null ? null : CorePalette.fromList(result.toList());
  }
}
