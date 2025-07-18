import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../creatives/app_colors.dart';

class AppNeumorphicTheme extends StatelessWidget {
  final Widget child;

  const AppNeumorphicTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).scaffoldBackgroundColor
            : secondaryTextLight,
      ),
      child: child,
    );
  }
}
