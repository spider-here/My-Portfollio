import 'package:flutter/cupertino.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class SpaceBox extends StatelessWidget {
  final bool vertical;
  final double space;
  const SpaceBox({super.key,
    this.vertical = true, required this.space,
  });
  const SpaceBox.horizontal({super.key, required this.space }) : vertical = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !vertical ? context.widthFromDesign(space) : null,
      height: vertical ? context.heightFromDesign(space) : null,
    );
  }
}
