import 'dart:ui';

import 'package:flutter/material.dart';

/// Shifts color [from] towards color [to].
int _harmonizeColor(Color from, Color to) {
  if (from == to) return from.value;
  return from.value;
  // return monet.smartBlend(from.value, to.value, hueP: 0.25, chroma: 0);
}

extension _ColorHarmonization on Color {
  /// Harmonizes this color with [primary].
  Color harmonizeWithPrimary(Color primary) {
    int harmonizedColor = _harmonizeColor(this, primary);
    return Color(harmonizedColor);
  }
}

extension ColorSchemeHarmonization on ColorScheme {
  /// Harmonizes specified [ColorScheme] colors with its primary color.
  ///
  /// TODO(guidezpl): link to spec
  ///
  /// By default, only semantic colors (i.e. colors with meaning) are harmonized.
  /// Semantic colors are [error] and [onError].
  ColorScheme harmonized({
    // No need to harmonize [primary] with itself.
    bool primaryVariant = false,
    bool secondary = false,
    bool secondaryVariant = false,
    bool surface = false,
    bool background = false,
    bool error = true,
    bool onPrimary = false,
    bool onSecondary = false,
    bool onSurface = false,
    bool onBackground = false,
    bool onError = true,
  }) {
    return copyWith(
      // TODO(guidezpl): what about adding isHarmonized bool to ColorScheme?
      primaryVariant: !primaryVariant
          ? this.primaryVariant
          : this.primaryVariant.harmonizeWithPrimary(primary),
      secondary: !secondary
          ? this.secondary
          : this.secondary.harmonizeWithPrimary(primary),
      secondaryVariant: !secondaryVariant
          ? this.secondaryVariant
          : this.secondaryVariant.harmonizeWithPrimary(primary),
      surface:
          !surface ? this.surface : this.surface.harmonizeWithPrimary(primary),
      background: !background
          ? this.background
          : this.background.harmonizeWithPrimary(primary),
      error: !error ? this.error : this.error.harmonizeWithPrimary(primary),
      onPrimary: !onPrimary
          ? this.onPrimary
          : this.onPrimary.harmonizeWithPrimary(primary),
      onSecondary: !onSecondary
          ? this.onSecondary
          : this.onSecondary.harmonizeWithPrimary(primary),
      onSurface: !onSurface
          ? this.onSurface
          : this.onSurface.harmonizeWithPrimary(primary),
      onBackground: !onBackground
          ? this.onBackground
          : this.onBackground.harmonizeWithPrimary(primary),
      onError:
          !onError ? this.onError : this.onError.harmonizeWithPrimary(primary),
    );
  }
}
