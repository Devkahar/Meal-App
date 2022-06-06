import 'package:flutter/material.dart';
import '/pages/filter_screen.dart';
import '/pages/meal_detail_screen.dart';
import './pages/categories_meal_screen.dart';
import './pages/categories_screen.dart';
import 'pages/tabs_screen.dart';
import './models/meal.dart';
import './widgets/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeal = DUMMY_MEALS;
  @override
  Map<String,bool> _filters = {
    'gluten': false,
    'lacose': false,
    'vegan': false,
    'vegetarina': false,
  };

  void saveFilter(Map<String,bool> data){
    setState((){
      _filters = data;
      _availableMeal = DUMMY_MEALS.where((element) {
        if(_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if(_filters['lacose'] as bool && !element.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }
        if(_filters['vegetarina'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  Widget build(BuildContext context) {
    print(_availableMeal);
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
        '/': (ctx) => const TabsScreen(),
        '/category-meals': (ctx) => CategoryMealScreen(availableMeal: _availableMeal),
        '/meal-detail': (ctx)=> const MealDetail(),
        '/filter': (ctx)=>  FilterScreen(saveFilter: saveFilter,),
      },
    );
  }
}
