import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((category) => CategoryItem(
                color: category.color,
                title: category.title,
                id: category.id,
              ))
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
