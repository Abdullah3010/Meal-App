import 'package:flutter/material.dart';
import '../screens/meal_screen.dart';

class Categories extends StatelessWidget {
  final String id;
  final Color color;
  final String title;

  const Categories({
    this.id,
    this.color,
    this.title,
  });

  void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealScreen.routName,
      arguments: {
        'id': this.id,
        'title': this.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.color.withOpacity(0.4),
              this.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
