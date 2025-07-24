import 'package:flutter/material.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';

import 'other_profiles.dart';

class DefaultPageBody extends StatelessWidget {
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;

  const DefaultPageBody({super.key, this.children, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          const Center(child: OtherProfiles()),
          const SpaceBox.horizontal(space: 50.0),
          if (children != null) ...?children
        ]);
  }
}
