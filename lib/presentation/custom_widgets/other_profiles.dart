import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/creatives/app_theme.dart';

import '../creatives/app_colors.dart';
import 'app_icon_button.dart';

class OtherProfiles extends StatelessWidget{

  OtherProfiles({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppIconButton(
            onClick: () {},
            icon: SvgPicture.asset(
              'icons/linkedin.svg',
              height: 30.0,
              width: 30.0,
              colorFilter: ColorFilter.mode(Get.isDarkMode ? primarySwatch.shade200 : primarySwatch, BlendMode.srcIn),
            )),
        AppIconButton(
            onClick: () {},
            icon: SvgPicture.asset(
              'icons/github.svg',
              height: 30.0,
              width: 30.0,
              colorFilter: ColorFilter.mode(Get.isDarkMode ? primarySwatch.shade200 : primarySwatch, BlendMode.srcIn),
            )),
      ],
    );
  }
}