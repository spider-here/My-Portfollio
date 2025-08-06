import 'package:flutter/cupertino.dart';

extension ResponsiveContext on BuildContext {
  // Existing props
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
  bool get isLandscape => screenHeight < screenWidth;

  double get designHeight => isLandscape ? 900.0 : 812.0;
  double get designWidth => isLandscape ? 1440.0 : 390.0;

  // Scale factors
  double get _scaleWidth => screenWidth / designWidth;
  double get _scaleHeight => screenHeight / designHeight;

  /// Geometric mean scaling factor for consistent scaling
  double get _scaleFactor {
    final double avg = (_scaleWidth + _scaleHeight) / 2;
    return isLandscape ? avg : avg.clamp(0.85, 1.0);
  }

  // Dimensions
  double heightFromDesign(double widgetHeight, {double? designHeight}) {
    return screenHeight / ((designHeight ?? this.designHeight) / widgetHeight);
  }

  double widthFromDesign(double widgetWidth, {double? designWidth}) {
    return screenWidth / ((designWidth ?? this.designWidth) / widgetWidth);
  }

  // Insets
  EdgeInsets designInsetLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
      widthFromDesign(left),
      heightFromDesign(top),
      widthFromDesign(right),
      heightFromDesign(bottom),
    );
  }

  EdgeInsets designInsetOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.fromLTRB(
      widthFromDesign(left),
      heightFromDesign(top),
      widthFromDesign(right),
      heightFromDesign(bottom),
    );
  }

  EdgeInsets designInsetSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return EdgeInsets.symmetric(
      vertical: heightFromDesign(vertical),
      horizontal: widthFromDesign(horizontal),
    );
  }

  EdgeInsets designInsetAll(double padding) {
    return EdgeInsets.only(
      left: widthFromDesign(padding),
      top: heightFromDesign(padding),
      right: widthFromDesign(padding),
      bottom: heightFromDesign(padding),
    );
  }

  /// New: Scale font size using average of width and height scaling
  double fontSizeFromDesign(double fontSize) {
    return fontSize * _scaleFactor;
  }

  /// New: Radius scaling using same logic
  double radiusFromDesign(double radius) {
    return radius * _scaleFactor;
  }
}
