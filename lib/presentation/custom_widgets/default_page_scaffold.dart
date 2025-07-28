import 'package:flutter/material.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class DefaultPageScaffold extends StatelessWidget{
  final Widget? body;
  final Widget? footer;
  const DefaultPageScaffold({super.key, this.body, this.footer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: footer,
      body: Padding(padding: context.designInsetLTRB(100.0, 100.0, 100.0, 50.0),
        child: body,
      ),
    );
  }
}
