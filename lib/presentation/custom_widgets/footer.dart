import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../data/local/local_data.dart';
import '../creatives/app_colors.dart';

class Footer extends StatelessWidget{
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightFromDesign(80.0),
      color: Get.isDarkMode ? footerDark : footerLight,
      padding: EdgeInsets.symmetric(horizontal: context.widthFromDesign(32.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(LocalData.copyright, style: context.textTheme.bodySmall?.copyWith(color: primaryTextDark),)
        ],
      ),
    );
  }
}