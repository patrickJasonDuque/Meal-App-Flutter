import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget mealLabelBuilder(BuildContext ctx, String title, String label) {
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

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(mealId);
          },
        ),
        appBar: AppBar(
          title: Text(mealData.title),
          actions: [
            IconButton(icon: Icon(Icons.star_outline), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(8.0),
                color: Color.fromRGBO(0, 0, 0, 0.6),
                child: Text(
                  mealData.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              mealLabelBuilder(context, 'Duration: ', '${mealData.duration}m'),
              mealLabelBuilder(context, 'Complexity: ',
                  mealData.complexity.toString().split('.')[1]),
              mealLabelBuilder(context, 'Affordability: ',
                  mealData.affordability.toString().split('.')[1]),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'Ingredients:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                height: 200,
                width: double.infinity,
                child: ListView(
                  children: [
                    ...mealData.ingredients.map((ingredient) => Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).accentColor),
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          ingredient,
                          style: TextStyle(fontSize: 18),
                        )))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'How to make:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                height: 200,
                width: double.infinity,
                child: ListView(
                  children: [
                    ...mealData.steps.map(
                      (step) => Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).accentColor),
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          step,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
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
