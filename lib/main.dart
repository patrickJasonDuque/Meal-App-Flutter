import 'package:flutter/material.dart';

import './screens/categories.dart';
import './screens/category_meal.dart';
import './screens/meal_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.greenAccent,
        fontFamily: 'Nunito',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.indigo[900], fontSize: 18),
              headline6: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMeal.routeName: (ctx) => CategoryMeal(),
        MealDetail.routeName: (ctx) => MealDetail()
      },
    );
  }
}
