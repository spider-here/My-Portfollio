import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_content_item.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_date_item.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../../../globals.dart';

class WorkView extends StatelessWidget {
  final ScrollPhysics physics;

  const WorkView({super.key, this.physics = const BouncingScrollPhysics()});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('work')
          .orderBy('startDate', descending: true)
          .get(),
      builder: (context, snapshot) {
        final docs = snapshot.data?.docs ?? [];
        return Timeline.tileBuilder(
          shrinkWrap: true,
          physics: physics,
          theme: TimelineThemeData(
            nodePosition: context.fontSizeFromDesign(0.30),
            color: context.appTheme.colorScheme.primary,
          ),
          builder: TimelineTileBuilder.connected(
            itemCount: docs.length,
            indicatorBuilder: (context, index) {
              return Container(
                width: context.widthFromDesign(12.0),
                height: context.heightFromDesign(12.0),
                decoration: BoxDecoration(
                  color: context.appTheme.colorScheme.primary,
                ),
              );
            },
            itemExtent: context.heightFromDesign(140.0),
            connectorBuilder: (context, index, type) {
              return DashedLineConnector(
                color: context.appTheme.colorScheme.primary,
              );
            },
            contentsBuilder: (context, index) {
              final doc = docs[index];
              final String title = doc['job'] ?? '';
              final String subtitle = doc['company'] ?? '';
              final String description = doc['location'] ?? '';

              return TimelineContentItem(
                title: title,
                subtitle: subtitle,
                description: description,
              );
            },
            oppositeContentsBuilder: (context, index) {
              final doc = docs[index];
              final bool present = doc['present'] ?? true;
              final String startDate = Globals.timestampToString(
                  doc['startDate'] ?? Timestamp.now());
              final String endDate = present
                  ? 'Present'
                  : Globals.timestampToString(
                      doc['endDate'] ?? Timestamp.now());

              return SizedBox(
                width: context.widthFromDesign(150.0),
                child: TimelineDateItem(date: '$startDate - $endDate'),
              );
            },
          ),
        );
      },
    );
  }
}
