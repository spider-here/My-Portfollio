import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppNeumorphic(
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            isDense: true,
            floatingLabelStyle: TextStyle(
              color: context.appTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
