import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.shadowBelow,
    required this.shadowAbove,
    required this.textColor,
    required this.danger,
    required this.iconColor,
  });
  final Color? shadowBelow;
  final Color? shadowAbove;
  final Color? textColor;
  final Color? danger;
  final Color? iconColor;
  @override
  CustomColors copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
  }) {
    return CustomColors(
      shadowBelow: success ?? this.shadowBelow,
      shadowAbove: info ?? this.shadowAbove,
      textColor: warning ?? this.textColor,
      danger: danger ?? this.danger,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      shadowBelow: Color.lerp(shadowBelow, other.shadowBelow, t),
      shadowAbove: Color.lerp(shadowAbove, other.shadowAbove, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      danger: Color.lerp(danger, other.danger, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),

    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'success: $shadowBelow, info: $shadowAbove, warning: $shadowAbove, danger: $danger'
      ')';
  // the light theme
  static const light = CustomColors(
    shadowBelow: Color.fromARGB(255, 41, 41, 41),
    shadowAbove: Color.fromARGB(255, 230, 228, 228),
    textColor: Color.fromARGB(255, 58, 58, 58),
    danger: Color(0xffdc3545),
    iconColor: Color.fromARGB(255, 58, 58, 58),
  );
  // the dark theme
  static const dark = CustomColors(
    shadowBelow: Color.fromARGB(255, 0, 0, 0),
    shadowAbove: Color.fromARGB(255, 170, 169, 169),
    textColor: Color.fromARGB(255, 224, 223, 222),
    danger: Color(0xffe74c3c),
    iconColor: Color.fromARGB(255, 218, 217, 217),
  );
}
