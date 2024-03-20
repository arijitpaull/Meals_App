import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

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


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 3/2
        ),
        children: [content,]
      ),
    );
  }
}