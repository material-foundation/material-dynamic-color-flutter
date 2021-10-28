# dynamic_color

[![ci](https://github.com/material-foundation/material-dynamic-color-flutter/actions/workflows/test.yml/badge.svg)](https://github.com/material-foundation/material-dynamic-color-flutter/actions/workflows/test.yml)
[![pub package](https://img.shields.io/pub/v/dynamic_color.svg)](https://pub.dev/packages/dynamic_color)

A Flutter plugin to obtain dynamic colors on Android S+ and create harmonized
color schemes.

Learn more about [dynamic color](https://m3.material.io/styles/color/dynamic-color/overview) and [harmonization](https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization) on the Material 3 site.

## Features

### Builder widget

For convenience, this package includes `DynamicColorBuilder`, a stateful widget
that provides the device's dynamic colors in a [`CorePalette`][corepalette].

### Plugin

Under the hood, `DynamicColorBuilder` uses a plugin to talk to the Android OS.

### Color and color scheme harmonization

How do we ensure any particular color (i.e. semantic or custom color)
looks good next to a user's dynamically-generated color?

This package provides two extension methods, `Color.harmonizeWith()` and
`ColorScheme.harmonized()` to accomplish this.

`Color.harmonizeWith()` shift the hue of the color towards the passed in
color, typically `colorScheme.primary`. This leaves the color recognizable
while harmonizing it.

`ColorScheme.harmonized()` does the same thing, for all `ColorScheme`'s
semantic and custom colors. See [harmonization.dart] for more.

## Getting started

`flutter pub add dynamic_color`

```dart
import 'package:dynamic_color/dynamic_color.dart';
```

## Usage

See this [complete example] for obtaining dynamic colors and creating
a harmonized color scheme. Essentially, we wrap our `MaterialApp` with a
`DynamicColorBuilder`, and create:

- a dynamic color scheme that we harmonize
- a fallback color scheme

Run [all examples] with

```
cd example
flutter run
```

<img src="https://user-images.githubusercontent.com/6655696/135640136-4067dea1-99de-4693-b583-081e276ec7bf.png" width="400" />

[corepalette]: https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/lib/src/core_palette.dart
[all examples]: https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/example/lib/
[complete example]: https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/example/lib/complete_example.dart
[dynamiccolorbuilder example]: https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/example/lib/dynamic_color_builder_example.dart
[dynamiccolorplugin.getcorepalette example]: https://github.com/material-foundation/material-dynamic-color-flutter/tree/main/example/lib/get_core_palette_example.dart
[harmonization.dart]: https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/lib/src/harmonization.dart
