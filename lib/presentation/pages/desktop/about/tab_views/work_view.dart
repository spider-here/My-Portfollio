import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zakwan_ali_portfolio/data/local/local_data.dart';
import 'package:zakwan_ali_portfolio/data/models/work_experience.dart';
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
    return Timeline.tileBuilder(
      shrinkWrap: true,
      physics: physics,
      theme: TimelineThemeData(
        nodePosition: context.fontSizeFromDesign(0.30),
        color: context.appTheme.colorScheme.primary,
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: LocalData.workExperiences.length,
        indicatorBuilder: (BuildContext context, int index) {
          return Container(
            width: context.widthFromDesign(12.0),
            height: context.heightFromDesign(12.0),
            decoration: BoxDecoration(
              color: context.appTheme.colorScheme.primary,
            ),
          );
        },
        itemExtent: context.heightFromDesign(140.0),
        connectorBuilder: (BuildContext context, int index, ConnectorType type) {
          return DashedLineConnector(
            color: context.appTheme.colorScheme.primary,
          );
        },
        contentsBuilder: (BuildContext context, int index) {
          final WorkExperience doc = LocalData.workExperiences[index];
          return TimelineContentItem(
            title: doc.designation,
            subtitle: doc.company,
            description: doc.location,
          );
        },
        oppositeContentsBuilder: (BuildContext context, int index) {
          final WorkExperience doc = LocalData.workExperiences[index];
          final bool present = doc.present;
          final String startDate = Globals.timestampToString(
              doc.startDate);
          final String endDate = present
              ? 'Present'
              : Globals.timestampToString(
              doc.endDate ?? Timestamp.now());

          return SizedBox(
            width: context.widthFromDesign(150.0),
            child: TimelineDateItem(date: '$startDate - $endDate'),
          );
        },
      ),
    );
  }
}
