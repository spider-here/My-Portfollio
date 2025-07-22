import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';

class PageTitle extends TypeWriterText{
  PageTitle({super.key, required BuildContext context, required String text}):super(
    text: Text(
      text,
      style: context.appTextTheme.headlineMedium,
      textAlign: TextAlign.start,
    ),
    duration: const Duration(
        milliseconds: 1),
  );
}