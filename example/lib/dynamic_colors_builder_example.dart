import 'package:dynamic_colors/dynamic_colors_builder.dart';
import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  static const title = 'DynamicColorsBuilder';

  @override
  Widget build(BuildContext context) {
    return DynamicColorsBuilder(
      builder: (KeyPalettes? dynamicColors) {
        return MaterialApp(
          home: Scaffold(
            body: Container(
              // On Android S+ devices, use the 40 tone of the dynamic primary key palette.
              // Otherwise, default to a 600 shade amber.
              color: dynamicColors?.primary.tone40 ?? Colors.amber.shade600,
              child: const Center(
                child: Text('The background color is either dynamic or amber'),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
