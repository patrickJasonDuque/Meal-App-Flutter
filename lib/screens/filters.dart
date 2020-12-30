import 'package:flutter/material.dart';

import '../widgets/drawer_navigation.dart';

class Filters extends StatefulWidget {
  static const String routeName = 'filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;

  Widget _buildFilterSwitch(BuildContext ctx, String title, String subtitle,
      bool value, Function change) {
    return SwitchListTile(
      value: value,
      onChanged: change,
      subtitle: Text(subtitle),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Nunito', fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerNavigation(),
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(
          children: <Widget>[
            _buildFilterSwitch(context, 'Vegan', 'Vegan only meals', _isVegan,
                (value) => setState(() => _isVegan = value)),
            _buildFilterSwitch(
                context,
                'Vegetarian',
                'Vegetarian only meals',
                _isVegetarian,
                (value) => setState(() => _isVegetarian = value)),
            _buildFilterSwitch(
                context,
                'Lactose Free',
                'Lactose free meals',
                _isLactoseFree,
                (value) => setState(() => _isLactoseFree = value)),
            _buildFilterSwitch(
                context,
                'Gluten Free',
                'Gluten free meals',
                _isGlutenFree,
                (value) => setState(() => _isGlutenFree = value)),
          ],
        ),
      ),
    );
  }
}
