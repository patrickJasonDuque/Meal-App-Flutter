import 'package:flutter/material.dart';

import '../widgets/drawer_navigation.dart';

import './categories.dart';
import './favorites.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  static const List<Map<String, Object>> _widgetList = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];

  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).accentColor;

    Widget menu() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 10,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: color,
        onTap: _onSelectPage,
      );
    }

    return SafeArea(
      child: Scaffold(
        drawer: DrawerNavigation(),
        appBar: AppBar(
          title: Text(_widgetList[_selectedIndex]['title']),
        ),
        body: _widgetList[_selectedIndex]['page'],
        bottomNavigationBar: menu(),
      ),
    );
  }
}
