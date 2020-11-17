import 'package:flutter/material.dart';

class MealDetailLabel extends StatelessWidget {
  final String title;
  final String label;

  MealDetailLabel(this.title, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          Text(label, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
