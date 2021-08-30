import 'package:dynamic_colors/dynamic_colors_builder.dart';
import 'package:dynamic_colors/harmonization.dart';
import 'package:dynamic_colors/tonal_palette.dart';
import 'package:flutter/material.dart';

class ExampleApp1 extends StatelessWidget {
  const ExampleApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorsBuilder(
      builder: (TonalPalette? dynamicColors) {
        // Usually, we might create a ColorScheme from scratch, but here, start from the default light scheme.
        final ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
          // On Android S+ devices, use the 500 shade of the primary tonal range.
          // On other platforms, default to a mid-range amber.
          primary: dynamicColors?.primary.shade500 ?? Colors.amber[500],
        );
        return MaterialApp(
          theme: ThemeData(
            /// Harmonize semantic colors, such as [ColorScheme.error], which by default is a dark red.
            /// Not doing so would cause semantic colors to look out of place next to dynamic colors.
            colorScheme: lightColorScheme.harmonized(),
          ),
          home: Scaffold(
            body: Container(
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text('Full example app'),
                // TODO(guidezpl): add something showing error
              ),
            ),
          ),
        );
      },
    );
  }
}
