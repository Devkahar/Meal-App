import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import '../widgets/dummy_data.dart';
class CategoryMealScreen extends StatelessWidget {

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final recipyList = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!),),
      body: ListView.builder(itemBuilder: (_,index){
          return MealItem(title: recipyList[index].title, imageUrl: recipyList[index].imageUrl, duration: recipyList[index].duration, complexity: recipyList[index].complexity, affordability: recipyList[index].affordability);
      },itemCount: recipyList.length,),
    );
  }
}
