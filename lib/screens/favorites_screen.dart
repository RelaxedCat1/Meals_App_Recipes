import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
        return Center(
      child: Text('You Have No Edits Yet - start Adding Some!'));
    } else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            id: favoriteMeals[index].id,  
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  
 
  }
}