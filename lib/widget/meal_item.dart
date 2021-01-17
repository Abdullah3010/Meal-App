import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import '../models/Meal.dart';

class Meals extends StatelessWidget {
  final String id;
  final String url;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  const Meals({
    this.id,
    this.url,
    this.title,
    this.duration,
    this.complexity,
    this.affordability,
  });

  Widget getIconItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routName,
      arguments: this.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        elevation: 10,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(url),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getIconItem(Icons.access_alarm, "$duration min"),
                  getIconItem(Icons.work, "$complexityText"),
                  getIconItem(Icons.attach_money, "$affordabilityText"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
