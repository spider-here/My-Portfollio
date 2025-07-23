import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic_theme.dart';

class AppTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final double width;
  final double height;

  const AppTextArea({
    super.key,
    required this.controller,
    this.width = 300.0,
    this.height = 150.0, this.label = 'Message',
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return AppNeumorphicTheme(
      child: Builder(
        builder: (context) {
          final theme = NeumorphicTheme.currentTheme(context);

          return Neumorphic(
            style: NeumorphicStyle(
              depth: NeumorphicTheme.embossDepth(context),
              lightSource: theme.lightSource,
              boxShape: const NeumorphicBoxShape.rect(),
            ),
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: TextField(
                          controller: controller,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
