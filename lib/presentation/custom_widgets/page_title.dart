import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class PageTitle extends TypeWriterText{
  PageTitle({super.key, required BuildContext context, required String text}):super(
    text: Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.start,
    ),
    duration: const Duration(
        milliseconds: 1),
  );
}