import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            mealData.imageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          Container(
            child: Text(mealData.title,
                style: Theme.of(context).textTheme.headline6),
          ),
          // ListView(
          //   children: <Widget>[...mealData.steps.map((step) => Text(step))],
          // )
        ],
      ),
    );
  }
}
