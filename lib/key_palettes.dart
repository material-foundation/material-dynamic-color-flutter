import 'dart:ui';

import 'package:flutter/foundation.dart';

/// The 5 [KeyPalette]'s from which are derived Material You color schemess.
///
///
/// TODO(guidezpl): expand explanation, add screenshot, link to spec
class KeyPalettes {
  const KeyPalettes({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
  });

  /// The primary key palette (P).
  final KeyPalette primary;

  /// The secondary key palette (S).
  final KeyPalette secondary;

  /// The tertiary key palette (T).
  final KeyPalette tertiary;

  /// The neutral key palette (N).
  final KeyPalette neutral;

  /// The neutral variant key palette (NV).
  final KeyPalette neutralVariant;

  /// The number of [KeyPalette]s.
  static const size = 5;

  /// Turns a [List] of color [int]s representing concatenated key palettes into
  /// a [KeyPalettes] object.
  ///
  /// This is the inverse of [asList].
  KeyPalettes.fromList(List<int> palettes)
      : primary = KeyPalette.fromList(
          palettes.getPartition(2, KeyPalette.size),
        ),
        secondary = KeyPalette.fromList(
          palettes.getPartition(3, KeyPalette.size),
        ),
        tertiary = KeyPalette.fromList(
          palettes.getPartition(4, KeyPalette.size),
        ),
        neutral = KeyPalette.fromList(
          palettes.getPartition(0, KeyPalette.size),
        ),
        neutralVariant = KeyPalette.fromList(
          palettes.getPartition(1, KeyPalette.size),
        );

  /// Returns all of the colors in each key palette in one long [List] of color [int]s.
  ///
  /// This is the inverse of [KeyPalettes.fromList].
  List<int> asList() => [
        ...primary.allTones,
        ...secondary.allTones,
        ...tertiary.allTones,
        ...neutral.allTones,
        ...neutralVariant.allTones,
      ].map((color) => color.value).toList();

  @override
  String toString() {
    return 'Primary: $primary\n'
        'Secondary: $secondary\n'
        'Tertiary: $tertiary\n'
        'Neutral: $neutral\n'
        'Neutral variant: $neutralVariant\n';
  }

  @override
  bool operator ==(Object other) {
    return other is KeyPalettes &&
        primary == other.primary &&
        secondary == other.secondary &&
        tertiary == other.tertiary &&
        neutral == other.neutral &&
        neutralVariant == other.neutralVariant;
  }

  @override
  int get hashCode =>
      hashValues(primary, secondary, tertiary, neutral, neutralVariant);
}

/// A key palette contains 13 [Color] tones based on a single key color.
///
/// The tones range from 0 to 100, from darkest to lightest. The 0 tone is
/// always black and the 100 tone is always white.
class KeyPalette {
  const KeyPalette(
    this.tone0,
    this.tone10,
    this.tone20,
    this.tone30,
    this.tone40,
    this.tone50,
    this.tone60,
    this.tone70,
    this.tone80,
    this.tone90,
    this.tone95,
    this.tone99,
    this.tone100,
  );

  KeyPalette.fromList(List<int> colors)
      : tone0 = Color(colors[0]),
        tone10 = Color(colors[1]),
        tone20 = Color(colors[2]),
        tone30 = Color(colors[3]),
        tone40 = Color(colors[4]),
        tone50 = Color(colors[5]),
        tone60 = Color(colors[6]),
        tone70 = Color(colors[7]),
        tone80 = Color(colors[8]),
        tone90 = Color(colors[9]),
        tone95 = Color(colors[10]),
        tone99 = Color(colors[11]),
        tone100 = Color(colors[12]);

  final Color tone0; // Always 100% black
  final Color tone10;
  final Color tone20;
  final Color tone30;
  final Color tone40;
  final Color tone50;
  final Color tone60;
  final Color tone70;
  final Color tone80;
  final Color tone90;
  final Color tone95;
  final Color tone99;
  final Color tone100; // Always 100% white

  // How many tones there are in a key palette.
  static const size = 13;

  /// Returns all the tones in this key palette as a list from tone 0 to 100.
  List<Color> get allTones => [
        tone0,
        tone10,
        tone20,
        tone30,
        tone40,
        tone50,
        tone60,
        tone70,
        tone80,
        tone90,
        tone95,
        tone99,
        tone100,
      ];

  static const List<int> toneValues = [
    0,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    95,
    99,
    100,
  ];

  @override
  String toString() {
    return '{0: $tone0 '
        '10: $tone10 '
        '20: $tone20 '
        '30: $tone30 '
        '40: $tone40 '
        '50: $tone50 '
        '60: $tone60 '
        '70: $tone70 '
        '80: $tone80 '
        '90: $tone90 '
        '95: $tone95 '
        '99: $tone99 '
        '100: $tone100}';
  }

  @override
  bool operator ==(Object other) {
    return other is KeyPalette && listEquals(allTones, other.allTones);
  }

  @override
  int get hashCode => hashList(allTones);
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
