import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal_detail_screen';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.isMealFavorite, this.toggleFavorite);

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      width: 320,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  buildTitle(context, "Ingredients"),
                  buildContainer(
                    context,
                    ListView.builder(
                      itemBuilder: (context, index) => Card(
                        color: Theme.of(context).accentColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                      itemCount: selectedMeal.ingredients.length,
                    ),
                  ),
                  buildTitle(context, "Steps"),
                  buildContainer(
                    context,
                    ListView.builder(
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("# ${index + 1}"),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      itemCount: selectedMeal.steps.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
