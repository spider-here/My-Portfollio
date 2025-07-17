import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/presentation/pages_controller.dart';
import '../../../../controllers/presentation/theme_controller.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';
import '../../../custom_widgets/portfolio_item.dart';
import '../../../custom_widgets/scroll_widget.dart';

class DPortfolio extends StatelessWidget{
  final ThemeController themeC = Get.find<ThemeController>();
  final PagesController pagesC = Get.find<PagesController>();

  DPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultPageScaffold(
      body: DefaultPageBody(
        children: [
          const Padding(padding: EdgeInsets.only(left: 50.0)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(context: context, text: 'My portfolio'),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  Expanded(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                          childAspectRatio: size.width/size.height),
                          itemCount: 12,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i){
                            return PortfolioItem();
                          })
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  ScrollWidget(
                    onClick: pagesC.nextPage,
                    scrollDown: true,
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