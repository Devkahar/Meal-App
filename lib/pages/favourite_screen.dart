
import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
  final favouriteList;

  const FavouriteScreen({Key? key, this.favouriteList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Meal> displayRecipe = DUMMY_MEALS.where((element){
      for(int i =0;i<favouriteList.length;i++){
          if(favouriteList[i]==element.id) return true;
      }
      return false;
    }).toList();
    print(displayRecipe);
    return ListView.builder(itemBuilder: (_,index){
      return MealItem(
          title: displayRecipe[index].title, imageUrl: displayRecipe[index].imageUrl, duration: displayRecipe[index].duration, complexity: displayRecipe[index].complexity, affordability: displayRecipe[index].affordability,id: displayRecipe[index].id,deleteRecipe: (){}
      );
    },itemCount: displayRecipe.length,);
  }
}
