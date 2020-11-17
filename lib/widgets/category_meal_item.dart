import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';

import '../models/meal.dart';

class CategoryMealItem extends StatelessWidget {
  final String title;
  final int duration;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final String id;

  CategoryMealItem(
      {this.duration,
      this.title,
      this.imageUrl,
      this.affordability,
      this.id,
      this.complexity});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: id);
  }

  Widget buildCategoryMealLabel(BuildContext ctx, String text, IconData icon) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Icon(
            icon,
            color: Theme.of(ctx).primaryColor,
          ),
        ),
        Text(
          text,
          style: Theme.of(ctx).textTheme.bodyText1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          ),
          elevation: 6,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    color: Color.fromRGBO(0, 0, 0, .6),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildCategoryMealLabel(
                      context,
                      '${duration}m',
                      Icons.access_time_outlined,
                    ),
                    buildCategoryMealLabel(
                      context,
                      affordability.toString().split('.')[1],
                      Icons.attach_money_outlined,
                    ),
                    buildCategoryMealLabel(
                        context,
                        complexity.toString().split('.')[1],
                        Icons.work_outline),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
