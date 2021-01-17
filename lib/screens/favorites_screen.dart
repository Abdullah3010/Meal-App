import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteleMeal;

  FavoriteScreen(this.favoriteleMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteleMeal.isEmpty) {
      return Center(
        child: Text("You have no favorites meal!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Meals(
            id : favoriteleMeal[index].id,
            url: favoriteleMeal[index].imageUrl,
            title: favoriteleMeal[index].title,
            duration: favoriteleMeal[index].duration,
            complexity: favoriteleMeal[index].complexity,
            affordability: favoriteleMeal[index].affordability,
          );
        },
        itemCount: favoriteleMeal.length,
      );
    }
  }
}
