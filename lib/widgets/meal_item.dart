import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,

            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                 color: const Color.fromARGB(113, 0, 0, 0),
                 padding: const EdgeInsets.symmetric(vertical:6 ,horizontal: 44),
                 child: Column(
                  children: [
                    Text(
                      meal.title, 
                      maxLines: 2, 
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 10,),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 10,),
                        MealItemTrait(icon: Icons.currency_rupee_sharp, label: affordabilityText)
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}