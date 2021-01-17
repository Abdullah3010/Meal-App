import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerItems(IconData icon, String title, Function fn) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
        ),
      ),
      onTap: fn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Meal App",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          buildDrawerItems(
            Icons.restaurant_menu,
            "Meals",
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildDrawerItems(
            Icons.settings,
            "Filters",
            () {
              Navigator.of(context).pushNamed(FilterScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
