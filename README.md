# dynamic_colors

A Flutter plugin to obtain dynamic colors on Android S+.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

`flutter pub add dynamic_colors`

## Usage

There are two ways to use this plugin. 

1. `DynamicColorsBuilder`, a convenience stateful builder widget that provides
   the dynamic colors in a [`TonalPalette`](lib/tonal_palette.dart). This uses 
   `2.` under the hood. [Example](example/lib/dynamic_colors_builder_example.dart)

2. `DynamicColorsPlugin.getDynamicColors()`, which requests the colors 
   asynchronously, returns the dynamic colors in a 
   [`TonalPalette`](lib/tonal_palette.dart). The developer is responsible for 
   obtaining and storing the `TonalPalette`.
   [Example](example/lib/get_dynamic_colors_example.dart)

The `TonalPalette` object will be `null` on non-Android platforms and 
pre-Android S devices.

















## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.