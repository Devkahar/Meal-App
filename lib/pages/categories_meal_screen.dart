import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import '../widgets/dummy_data.dart';
import '../models/meal.dart';
class CategoryMealScreen extends StatefulWidget {

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle='text';

  List<Meal> displayRecipe=[];


  @override
  void didChangeDependencies(){
    final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    categoryTitle = routeArg['title'] as String;
    final categoryId = routeArg['id'];
    displayRecipe = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void deleteRecipe(String id){
    setState((){
      displayRecipe.removeWhere((element) => element.id==id);
    });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (_,index){
          return MealItem(title: displayRecipe[index].title, imageUrl: displayRecipe[index].imageUrl, duration: displayRecipe[index].duration, complexity: displayRecipe[index].complexity, affordability: displayRecipe[index].affordability,id: displayRecipe[index].id,deleteRecipe: deleteRecipe,);
      },itemCount: displayRecipe.length,),
    );
  }
}
