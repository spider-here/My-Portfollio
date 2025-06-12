import 'package:flutter/material.dart';

class TimelineDateItem extends StatelessWidget {
  final String date;
  const TimelineDateItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(date, style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

}