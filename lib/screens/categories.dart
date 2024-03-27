import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  
  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(context,
      MaterialPageRoute(builder: (ctx) => 
        MealsScreen(title: category.title, meals: filteredMeals,)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a category')
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 3/2
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: (){
              _selectCategory(context,category);
            },
          )
        ],
      ),
    );
  }
}

