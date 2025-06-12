
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/tab_views/qualifications_view.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/about/tab_views/work_view.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../../controllers/presentation/theme_controller.dart';
import '../../../../globals.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/defaultPageBody.dart';
import '../../../custom_widgets/defaultPageScaffold.dart';
import '../../../custom_widgets/pageTitle.dart';
import '../../../custom_widgets/scroll_widget.dart';

class DAbout extends StatelessWidget {
  final ThemeController themeC = Get.find<ThemeController>();
  final PagesController pagesC = Get.find<PagesController>();

  DAbout({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultPageScaffold(
      body: DefaultPageBody(
        children: [const Padding(padding: EdgeInsets.only(left: 50.0)),
          SizedBox(
            width: size.width / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(context: context, text: 'About me'),
                const Text('Passionate and skilled in the realm of Computer Science,'
                    ' I bring a wealth of experience and expertise in web and mobile application development,'
                    ' particularly in Flutter. With a solid foundation in Agile methodologies,'
                    ' I have led teams to deliver high-quality Android, iOS, and web applications,'
                    ' showcasing advanced logic building and robust problem-solving abilities.'
                    ' My commitment to continuous learning is evident through certifications'
                    ' in Flutter Application Development and Microsoft Office Expertise.'
                    ' As a technology enthusiast, I stay abreast of modern trends while honing my skills in full-stack development,'
                    ' API integration, debugging, and IT support. With a track record of successfully leading projects,'
                    ' I am driven by a relentless pursuit of excellence and thrive in dynamic,'
                    ' collaborative environments where I can apply and refine my skills to drive impactful solutions.',
                  textAlign: TextAlign.justify,
                ),
                ScrollWidget(
                  onClick: () {
                    pagesC.nextPage();
                  },
                  scrollDown: true,
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: size.width / 3.5,
            padding: const EdgeInsets.only(top: 18.0),
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size.width / 3.5,
                    height: 50.0,
                    child: TabBar(
                      dividerHeight: 0.0,
                      splashBorderRadius: BorderRadius.zero,
                      indicatorColor:
                      Theme.of(context).textTheme.headlineMedium?.color,
                      labelColor:
                      Theme.of(context).textTheme.headlineMedium?.color,
                      tabs: [
                        Tab(
                          height: 30.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.work_rounded,
                                size: 20.0,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text(
                                'Work',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.fontSize),
                              )
                            ],
                          ),
                        ),
                        Tab(
                          height: 30.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20.0,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text(
                                'Qualification',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.fontSize),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        WorkView(),
                        QualificationsView(),
                      ],
                    ),
                  ),
                  AppElevatedButton(
                      onClick: () {
                        Globals.downloadFile('https://firebasestorage.googleapis.com/v0/b/zakwan-ali.appspot.com/o/cv%2FZakwan%20Ali%20Tariq%20-%20CV.pdf?alt=media&token=f2596387-81e5-494d-b049-d6a52be00222');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            size: 14.0,
                            color: primaryTextDark,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10.0)),
                          Text(
                            'Download Resume',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                color: primaryTextDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          const Spacer(),],
      ),
    );
  }
}
