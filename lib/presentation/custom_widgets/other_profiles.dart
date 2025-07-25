import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../creatives/app_colors.dart';
import 'app_icon_button.dart';

class OtherProfiles extends StatelessWidget{

  const OtherProfiles({super.key});
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
              height: context.heightFromDesign(30.0),
              width: context.widthFromDesign(30.0),
              colorFilter: ColorFilter.mode(Get.isDarkMode ? primarySwatchLight.shade200 : primarySwatchLight, BlendMode.srcIn),
            )),
        AppIconButton(
            onClick: () {},
            icon: SvgPicture.asset(
              'icons/github.svg',
              height: context.heightFromDesign(30.0),
              width: context.widthFromDesign(30.0),
              colorFilter: ColorFilter.mode(Get.isDarkMode ? primarySwatchLight.shade200 : primarySwatchLight, BlendMode.srcIn),
            )),
      ],
    );
  }
}