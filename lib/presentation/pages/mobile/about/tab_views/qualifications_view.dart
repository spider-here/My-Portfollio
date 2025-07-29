import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_content_item.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_date_item.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';


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
        final docs = snapshot.data?.docs ?? [];

        return Timeline.tileBuilder(
          shrinkWrap: true,
          theme: TimelineThemeData(
            nodePosition: context.fontSizeFromDesign(0.20),
            color: context.appTheme.colorScheme.primary,
          ),
          builder: TimelineTileBuilder.connected(
            itemCount: docs.length,
            itemExtent: context.heightFromDesign(140.0),
            indicatorBuilder: (context, index) {
              return Container(
                width: context.widthFromDesign(12.0),
                height: context.heightFromDesign(12.0),
                decoration: BoxDecoration(
                  color: context.appTheme.colorScheme.primary,
                ),
              );
            },
            connectorBuilder: (context, index, type) {
              return DashedLineConnector(
                color: context.appTheme.colorScheme.primary,
              );
            },
            contentsBuilder: (context, index) {
              final doc = docs[index];
              final String title = doc['title'] ?? '';
              final String subtitle = doc['subject'] ?? '';
              final String institute = doc['institute'] ?? '';
              final String location = doc['location'] ?? '';

              return TimelineContentItem(
                title: title,
                subtitle: subtitle,
                description: '$institute\n$location',
              );
            },
            oppositeContentsBuilder: (context, index) {
              final doc = docs[index];
              final Timestamp date = doc['endDate'] ?? Timestamp.now();
              final String dateYear = date.toDate().year.toString();

              return SizedBox(
                width: context.widthFromDesign(50.0),
                child: TimelineDateItem(date: dateYear),
              );
            },
          ),
        );
      },
    );

  }
}
