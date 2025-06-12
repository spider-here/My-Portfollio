import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

}