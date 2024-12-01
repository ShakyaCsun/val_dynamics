import 'package:flutter/material.dart';

/// {@template themed_value}
/// Helper class that helps to resolve a value based on the current app
/// [Brightness].
/// {@endtemplate}
class ThemedValue<T> {
  /// {@macro themed_value}
  const ThemedValue(this.dark, this.light);

  /// The value that should be used to when the dark theme is used.
  final T dark;

  /// The value that should be used to when the light theme is used.
  final T light;

  T getValue(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return dark;
      case Brightness.light:
        return light;
    }
  }

  T of(BuildContext context, {bool inverse = false}) {
    final brightness = Theme.of(context).brightness;
    if (inverse) {
      switch (brightness) {
        case Brightness.dark:
          return light;
        case Brightness.light:
          return dark;
      }
    }
    return getValue(brightness);
  }
}

/// A [ThemedValue] that resolves to [Color].
///
/// ```dart
/// final textColor = ThemedColor(Colors.white, Colors.black);
///
/// color.getValue(Brightness.dark); // Colors.black
/// color.getValue(Brightness.light); // Colors.white
/// ```
class ThemedColor extends ThemedValue<Color> {
  const ThemedColor(super.dark, super.light);
}
