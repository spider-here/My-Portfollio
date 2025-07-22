import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final String label;

  const AppTextField({
    super.key,
    required this.controller,
    this.width,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 800.0,
      child: AppNeumorphicTheme(
        child: Builder(
          builder: (context) {
            final theme = NeumorphicTheme.currentTheme(context);

            return Neumorphic(
              style: NeumorphicStyle(
                depth: NeumorphicTheme.embossDepth(context),
                lightSource: theme.lightSource,
                boxShape: const NeumorphicBoxShape.rect(),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  label: Text(label),
                  border: InputBorder.none,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
