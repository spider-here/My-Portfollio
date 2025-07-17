import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_content_item.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_date_item.dart';


class QualificationsView extends StatelessWidget {
  const QualificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('qualifications')
            .orderBy('endDate', descending: true)
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
                    final String title = doc?['title'] ?? '';
                    final String subtitle = doc?['subject'] ?? '';
                    final String description1 = doc?['institute'] ?? '';
                    final String description2 = doc?['location'] ?? '';

                    return TimelineContentItem(
                        title: title,
                        subtitle: subtitle,
                        description: '$description1\n$description2');
                  },
                  oppositeContentsBuilder: (context, index) {
                    final doc = snapshot.data?.docs[index];
                    final Timestamp date = doc?['endDate'] ?? Timestamp.now();
                    final String dateYear = date.toDate().year.toString();
                    return TimelineDateItem(date: dateYear);
                  }));
        });
  }
}
