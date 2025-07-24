import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

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
      width: context.widthFromDesign(width ?? 400.0),
      child: AppNeumorphic(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
            border: InputBorder.none,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
