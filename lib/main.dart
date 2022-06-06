import 'package:flutter/material.dart';
import 'package:mealsapp/pages/meal_detail_screen.dart';
import './pages/categories_meal_screen.dart';
import './pages/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                // bodyText1: const TextStyle(
                //   color: Color.fromRGBO(20, 51, 51, 1),
                // ),
                // bodyText2: const TextStyle(
                //   color: Color.fromRGBO(20, 51, 51, 1),
                // ),
                titleSmall: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
      routes: {
        '/': (ctx) => const CategorieScreen(),
        '/category-meals': (ctx) => const CategoryMealScreen(),
        '/meal-detail': (ctx)=> const MealDetail(),
      },
    );
  }
}
