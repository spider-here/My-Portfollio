import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class TimelineDateItem extends StatelessWidget {
  final String date;
  const TimelineDateItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.designInsetSymmetric(horizontal: 8.0),
      child: Text(date, style: context.textTheme.bodySmall,
      ),
    );
  }

}