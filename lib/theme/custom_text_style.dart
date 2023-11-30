import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Raleway text style
  static get ralewayWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 50.fSize,
        fontFamily: '',
        fontWeight: FontWeight.w700,
      ).raleway;
}

extension on TextStyle {
  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }
}
