import 'package:flutter/material.dart';

class DefaultPageScaffold extends Scaffold{
  DefaultPageScaffold({super.key, Widget? body}):super(
    body: Padding(padding: const EdgeInsets.fromLTRB(100.0, 100.0, 100.0, 50.0),
    child: body,
    )
  );
}
