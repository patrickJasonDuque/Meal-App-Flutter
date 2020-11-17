import 'package:flutter/material.dart';

class CategoryMealLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  const CategoryMealLabel({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    final TextStyle bodyText = Theme.of(context).textTheme.bodyText1;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          text,
          style: bodyText,
        ),
      ],
    );
  }
}
