import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TimelineContentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  const TimelineContentItem({super.key, required this.title, required this.subtitle, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall,
          ),
          Text(
            subtitle,
            style: context.textTheme.bodyMedium,
          ),
          Text(
            description,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

}