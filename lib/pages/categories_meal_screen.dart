import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import '../widgets/dummy_data.dart';
import '../models/meal.dart';
class CategoryMealScreen extends StatefulWidget {
  final availableMeal;
  const CategoryMealScreen({Key? key, this.availableMeal}) : super(key: key);

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

    displayRecipe = widget.availableMeal.where((meal){
      // return true;
      return meal.categories.contains(categoryId) as bool;
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
    print(widget.availableMeal[0].categories);
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (_,index){
          return MealItem(title: displayRecipe[index].title, imageUrl: displayRecipe[index].imageUrl, duration: displayRecipe[index].duration, complexity: displayRecipe[index].complexity, affordability: displayRecipe[index].affordability,id: displayRecipe[index].id,deleteRecipe: deleteRecipe,);
      },itemCount: displayRecipe.length,),
    );
  }
}
