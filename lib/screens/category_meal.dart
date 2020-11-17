import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

import '../widgets/category_meal_item.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName = '/category-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(routeArgs['id']))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title']),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (ctx, index) => CategoryMealItem(
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              id: categoryMeals[index].id,
            ),
            itemCount: categoryMeals.length,
          ),
        ));
  }
}
