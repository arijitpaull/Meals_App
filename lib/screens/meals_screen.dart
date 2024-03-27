import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, required this.title, required this. meals});
  final String title; 
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title));

    if(meals.isEmpty){
      content = Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nothing found here',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground)),
              const SizedBox(height: 10,),
              Text('Try a different category',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground)),
            ],
          ),
      );
    }

    if(meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index])
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, 
          childAspectRatio: 0.5
        ),
        children: [content,]
      ),
    );
  }
}