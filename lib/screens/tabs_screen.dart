import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widget/main_drawer.dart';
import 'favorites_screen.dart';
import 'category_screen.dart';

class TapsScreen extends StatefulWidget {

  final List<Meal> favoriteleMeal;

  TapsScreen(this.favoriteleMeal);

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  List<Map<String,Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': "Categories"},
      {'page': FavoriteScreen(widget.favoriteleMeal), 'title': "Favorites"}
    ];
    super.initState();
  }
  void _selectedPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'],
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
