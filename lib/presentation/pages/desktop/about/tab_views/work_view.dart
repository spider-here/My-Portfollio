import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_content_item.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_date_item.dart';

import '../../../../../globals.dart';

class WorkView extends StatelessWidget {
  const WorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('work')
            .orderBy('startDate', descending: true)
            .get(),
        builder: (context, snapshot) {
          return Timeline.tileBuilder(
            theme: TimelineThemeData(
              color: Theme.of(context).colorScheme.primary,
            ),
            shrinkWrap: true,
              builder: TimelineTileBuilder.fromStyle(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  connectorStyle: ConnectorStyle.dashedLine,
                  contentsBuilder: (context, index) {
                    final doc = snapshot.data?.docs[index];
                    final String title = doc?['job'] ?? '';
                    final String subtitle = doc?['company'] ?? '';
                    final String description = doc?['location'] ?? '';
                    return TimelineContentItem(title: title, subtitle: subtitle, description: description);
                  },
              oppositeContentsBuilder: (context, index){
                final doc = snapshot.data?.docs[index];
                final bool present = doc?['present'] ?? true;
                final String startDate = Globals.timestampToString(
                    doc?['startDate'] ?? Timestamp.now());
                final String endDate = present
                    ? 'Present'
                    : Globals.timestampToString(
                    doc?['endDate'] ?? Timestamp.now());
                return TimelineDateItem(date: '$startDate - $endDate');
              }
              ));
        });
  }
}
