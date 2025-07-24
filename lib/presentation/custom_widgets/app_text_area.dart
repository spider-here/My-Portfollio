import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class AppTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final double width;
  final double height;
  final FocusNode _focusNode = FocusNode();

  AppTextArea({
    super.key,
    required this.controller,
    this.width = 900.0,
    this.height = 300.0, this.label = 'Message',
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: AppNeumorphic(
        child: SizedBox(
          width: context.widthFromDesign(width),
          height: context.heightFromDesign(height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: TextField(
                      focusNode: _focusNode,
                      controller: controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: label,
                        border: InputBorder.none,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
