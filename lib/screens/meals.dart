import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,

  });

  final String? title;
  final List<Meal> meals;

  
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,

            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content =
     //   ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title));

    Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Uh oh.... Nothing here!",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(' Try Selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground))
      ],
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              ));
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
    }
  }
}