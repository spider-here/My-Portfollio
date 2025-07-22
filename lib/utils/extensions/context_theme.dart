import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}