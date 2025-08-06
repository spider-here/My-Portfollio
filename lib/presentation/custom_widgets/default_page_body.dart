import 'package:flutter/material.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';

import 'other_profiles.dart';

class DefaultPageBody extends StatelessWidget {
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool isLandscape;

  const DefaultPageBody({super.key, this.children, this.crossAxisAlignment, this.isLandscape = true});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: <Widget>[
          const Center(child: OtherProfiles()),
          isLandscape ? const SpaceBox.horizontal(space: 50.0) : const SpaceBox.horizontal(space: 16.0),
          if (children != null) ...?children
        ]);
  }
}
