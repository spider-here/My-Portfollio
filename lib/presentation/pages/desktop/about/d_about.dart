import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/tab_views/qualifications_view.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/tab_views/work_view.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../../data/local/local_data.dart';
import '../../../../globals.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';

class DAbout extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();

  DAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      body: DefaultPageBody(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: context.widthFromDesign(550.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle(context: context, text: 'About me'),
                const SpaceBox(space: 32.0),
                const Text(
                  LocalData.about,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SpaceBox.horizontal(space: 50.0),
          SizedBox(
            width: context.widthFromDesign(500.0),
            height: context.heightFromDesign(750.0),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: context.widthFromDesign(550.0),
                    height: context.heightFromDesign(50.0),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 0.0,
                      isScrollable: true,
                      splashBorderRadius: BorderRadius.zero,
                      indicatorColor: context.textTheme.headlineMedium?.color,
                      labelColor: context.textTheme.headlineMedium?.color,
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
                                        context.textTheme.bodySmall?.fontSize),
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
                                        context.textTheme.bodySmall?.fontSize),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: AppNeumorphic(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          WorkView(),
                          QualificationsView(),
                        ],
                      ),
                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.file_download_outlined,
                                size: context.fontSizeFromDesign(14.0),
                                color: primaryTextDark,
                              ),
                              const SpaceBox.horizontal(space: 10.0),
                              Text(
                                'Download Resume',
                                style: context.textTheme.bodySmall?.copyWith(
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
          ),
        ],
      ),
    );
  }
}
