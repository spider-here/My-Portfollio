import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../../data/local/local_data.dart';
import '../../../../globals.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/app_neumorphic.dart';
import '../../../custom_widgets/space_box.dart';
import '../../desktop/about/tab_views/qualifications_view.dart';
import '../../desktop/about/tab_views/work_view.dart';

class MAbout extends StatefulWidget {
  const MAbout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MAboutState();
  }

}

class _MAboutState extends State<MAbout> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final RxInt index = 0.obs;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      index.value = _tabController.index;
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          LocalData.about,
         textAlign: TextAlign.justify,
        ),
        const SpaceBox(space: 16.0),
        SizedBox(
            width: context.widthFromDesign(550.0),
            height: context.widthFromDesign(550.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  // width: context.widthFromDesign(550.0),
                  height: context.heightFromDesign(50.0),
                  child: TabBar(
                    controller: _tabController,
                    tabAlignment: TabAlignment.start,
                    dividerHeight: 0.0,
                    isScrollable: true,
                    splashBorderRadius: BorderRadius.zero,
                    indicatorColor: context.appTextTheme.headlineMedium
                        ?.color,
                    labelColor: context.appTextTheme.headlineMedium
                        ?.color,
                    tabs: <Widget>[
                      Tab(
                        height: context.heightFromDesign(30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.work_rounded,
                              size: context.fontSizeFromDesign(20.0),
                            ),
                            const SpaceBox.horizontal(space: 10.0),
                            Text(
                              'Work',
                              style: TextStyle(
                                  fontSize:
                                  context.appTextTheme.bodySmall
                                      ?.fontSize),
                            )
                          ],
                        ),
                      ),
                      Tab(
                        height: context.heightFromDesign(30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: context.fontSizeFromDesign(20.0),
                            ),
                            const SpaceBox.horizontal(space: 10.0),
                            Text(
                              'Qualification',
                              style: TextStyle(
                                  fontSize:
                                  context.appTextTheme.bodySmall
                                      ?.fontSize),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppNeumorphic(
                  child: Obx(() {
                    Widget currentView;
                    switch (index.value) {
                      case 0:
                        currentView = const WorkView(physics: NeverScrollableScrollPhysics());
                        break;
                      case 1:
                        currentView = const QualificationsView(physics: NeverScrollableScrollPhysics());
                        break;
                      default:
                        currentView = const SizedBox.shrink();
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: KeyedSubtree(
                        key: ValueKey<int>(index.value),
                        child: currentView,
                      ),
                    );
                  }),
                ),
                const SpaceBox(space: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AppElevatedButton(
                        onClick: () {
                          Globals.downloadFile(LocalData.resumeUrl);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.file_download_outlined,
                              size: context.fontSizeFromDesign(14.0),
                              color: primaryTextDark,
                            ),
                            const SpaceBox.horizontal(space: 10.0),
                            Text(
                              'Download Resume',
                              style: context.appTextTheme.bodySmall
                                  ?.copyWith(
                                  color: primaryTextDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

}