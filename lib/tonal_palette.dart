import 'dart:ui';

import 'package:flutter/foundation.dart';

/// Respresents a Material You tonal palette, consisting of 5 [TonalRange]s.
///
/// TODO(guidezpl): expand explanation, add screenshot, link to spec
class TonalPalette {
  const TonalPalette({
    required this.neutral,
    required this.neutralVariant,
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  /// The neutral tonal range (N).
  final TonalRange neutral;

  /// The neutral variant tonal range (NV).
  final TonalRange neutralVariant;

  /// The primary tonal range (P).
  final TonalRange primary;

  /// The secondary tonal range (S).
  final TonalRange secondary;

  /// The tertiary tonal range (T).
  final TonalRange tertiary;

  // How many tonal ranges there are in a tonal palette.
  static const size = 5;

  /// Turns a [List] of color [int]s representing concatenated tonal ranges into
  /// a [TonalPalette] object.
  ///
  /// This is the reverse of [asList].
  TonalPalette.fromList(List<int> colors)
      : assert(colors.length == TonalPalette.size * TonalRange.size),
        neutral = TonalRange.fromList(
          colors.getPartition(0, TonalRange.size),
        ),
        neutralVariant = TonalRange.fromList(
          colors.getPartition(1, TonalRange.size),
        ),
        primary = TonalRange.fromList(
          colors.getPartition(2, TonalRange.size),
        ),
        secondary = TonalRange.fromList(
          colors.getPartition(3, TonalRange.size),
        ),
        tertiary = TonalRange.fromList(
          colors.getPartition(4, TonalRange.size),
        );

  /// Returns all of the colors in each tonal range in one long [List] of color [int]s.
  ///
  /// This is the reverse of [TonalPalette.fromList].
  List<int> asList() => [
        ...neutral.allShades,
        ...neutralVariant.allShades,
        ...primary.allShades,
        ...secondary.allShades,
        ...tertiary.allShades,
      ].map((color) => color.value).toList();

  @override
  String toString() {
    return 'Neutral: $neutral\n'
        'Neutral variant: $neutralVariant\n'
        'Primary: $primary\n'
        'Secondary: $secondary\n'
        'Tertiary: $tertiary\n';
  }

  @override
  bool operator ==(Object other) {
    return other is TonalPalette &&
        neutral == other.neutral &&
        neutralVariant == other.neutralVariant &&
        primary == other.primary &&
        secondary == other.secondary &&
        tertiary == other.tertiary;
  }

  @override
  int get hashCode =>
      hashValues(neutral, neutralVariant, primary, secondary, tertiary);
}

/// A tonal range consists of 13 different colors.
///
/// A tonal range is a translation of one hue (a dynamic extracted color) into
/// a spectrum of related shades. The shades range from brightest (0) to darkest
/// (1000). The 0 shade is always 100% white and the 1000 shade is always 100%
/// black.
class TonalRange {
  const TonalRange(
    this.shade0,
    this.shade10,
    this.shade50,
    this.shade100,
    this.shade200,
    this.shade300,
    this.shade400,
    this.shade500,
    this.shade600,
    this.shade700,
    this.shade800,
    this.shade900,
    this.shade1000,
  );

  TonalRange.fromList(List<int> colors)
      : assert(colors.length == size),
        shade0 = Color(colors[0]),
        shade10 = Color(colors[1]),
        shade50 = Color(colors[2]),
        shade100 = Color(colors[3]),
        shade200 = Color(colors[4]),
        shade300 = Color(colors[5]),
        shade400 = Color(colors[6]),
        shade500 = Color(colors[7]),
        shade600 = Color(colors[8]),
        shade700 = Color(colors[9]),
        shade800 = Color(colors[10]),
        shade900 = Color(colors[11]),
        shade1000 = Color(colors[12]);

  final Color shade0; // Always 100% white
  final Color shade10;
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade1000; // Always 100% black

  // How many shades there are in a tonal range.
  static const size = 13;

  /// Returns all the shades in this tonal range as a list from shade 0 to 1000.
  List<Color> get allShades => [
        shade0,
        shade10,
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade1000,
      ];

  @override
  String toString() {
    return '{0: $shade0 '
        '50: $shade50 '
        '100: $shade100 '
        '200: $shade200 '
        '300: $shade300 '
        '400: $shade400 '
        '500: $shade500 '
        '600: $shade600 '
        '700: $shade700 '
        '800: $shade800 '
        '900: $shade900 '
        '1000: $shade1000}';
  }

  @override
  bool operator ==(Object other) {
    return other is TonalRange && listEquals(allShades, other.allShades);
  }

  @override
  int get hashCode => hashList(allShades);
}

extension _PartitionHelper on List<int> {
  // Returns a partition from a list.
  //
  // For example, given a list with 2 partitions of size 3.
  // range = [1, 2, 3, 4, 5, 6];
  //
  // range.getPartition(0, 3) // [1, 2, 3]
  // range.getPartition(1, 3) // [4, 5, 6]
  List<int> getPartition(int partitionNumber, int partitionSize) {
    return sublist(
      partitionNumber * partitionSize,
      (partitionNumber + 1) * partitionSize,
    );
  }
}
