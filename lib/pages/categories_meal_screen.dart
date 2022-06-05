

import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final recipeTitle = routeArg['title'];
    final recipeId = routeArg['id'];
    return Scaffold(
      appBar: AppBar(title: Text(recipeTitle!),),
      body: Center(child: const Text('Eat a Meal')),
    );
  }
}
