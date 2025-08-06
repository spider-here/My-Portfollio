import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/data/local/local_data.dart';
import 'package:zakwan_ali_portfolio/data/models/qualification.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_content_item.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/widgets/timeline_date_item.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class QualificationsView extends StatelessWidget {
  final ScrollPhysics physics;

  const QualificationsView(
      {super.key, this.physics = const BouncingScrollPhysics()});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      physics: physics,
      theme: TimelineThemeData(
        nodePosition: context.fontSizeFromDesign(0.20),
        color: context.appTheme.colorScheme.primary,
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: LocalData.qualifications.length,
        itemExtent: context.heightFromDesign(140.0),
        indicatorBuilder: (BuildContext context, int index) {
          return Container(
            width: context.widthFromDesign(12.0),
            height: context.heightFromDesign(12.0),
            decoration: BoxDecoration(
              color: context.appTheme.colorScheme.primary,
            ),
          );
        },
        connectorBuilder: (BuildContext context, int index, ConnectorType type) {
          return DashedLineConnector(
            color: context.appTheme.colorScheme.primary,
          );
        },
        contentsBuilder: (BuildContext context, int index) {
          final Qualification doc = LocalData.qualifications[index];
          final String title = doc.title;
          final String subtitle = doc.subject;
          final String institute = doc.institute;
          final String location = doc.location;

          return TimelineContentItem(
            title: title,
            subtitle: subtitle,
            description: '$institute\n$location',
          );
        },
        oppositeContentsBuilder: (BuildContext context, int index) {
          final Qualification doc = LocalData.qualifications[index];
          final Timestamp? date = doc.endDate;
          final String? dateYear = date?.toDate().year.toString();
          final bool present = doc.present;

          return SizedBox(
            width: context.widthFromDesign(50.0),
            child: TimelineDateItem(date: present ? 'Present' : dateYear!),
          );
        },
      ),
    );
  }
}
