import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/portfolio_item.dart';

class MPortfolio extends StatelessWidget{

  const MPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width/2,
      child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 0.8),
          itemCount: 12,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int i){
            return PortfolioItem();
          }),
    );
  }

}