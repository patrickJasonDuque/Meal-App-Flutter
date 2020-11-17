import 'package:flutter/material.dart';

import '../screens/category_meal.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20));

  const CategoryItem({@required this.title, this.color, this.id});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeal.routeName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 10,
        child: Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
