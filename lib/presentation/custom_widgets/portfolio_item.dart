import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class PortfolioItem extends StatelessWidget{
  final FlipCardController flipCardController = FlipCardController();

  PortfolioItem({super.key});
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: const Card(elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),),
      back: Card(elevation: 2.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/portrait.jpg'),
            fit: BoxFit.cover,
            opacity: 0.05,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Flutter simplifies mobile app development by offering a unified development platform for both Android and iOS. Its streamlined workflow and intuitive UI framework empowers to build visually stunning and feature-rich applications. Let\'s craft your next mobile app together and bring your ideas to life!',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      size: 10.0,
                    ),
                  ),
                  onTap: () {
                    flipCardController.toggleCard();
                  },
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'View more',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}