import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';

import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';
import '../../../custom_widgets/portfolio_item.dart';

class DPortfolio extends StatelessWidget{
  final PagesController pagesC = Get.find<PagesController>();

  DPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultPageScaffold(
      body: DefaultPageBody(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageTitle(context: context, text: 'My portfolio'),
                  const SpaceBox(
                    space: 50.0,
                  ),
                  Expanded(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                          childAspectRatio: size.width/size.height),
                          itemCount: 12,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int i){
                            return PortfolioItem();
                          })
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
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