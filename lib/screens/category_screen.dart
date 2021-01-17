import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/categories_items.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (item) => Categories(
                id: item.id,
                title: item.title,
                color: item.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
