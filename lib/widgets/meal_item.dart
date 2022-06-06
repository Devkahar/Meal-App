
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem({Key? key, required this.title, required this.imageUrl, required this.duration, required this.complexity, required this.affordability, required this.id}) : super(key: key);
  String get complexityText{
     List<String> compx = ["Simple","Challenging","Hard"];
     return compx[complexity.index];
  }
  String get affordabilityText{
    List<String> aff = ["Affordable","Pricey","Luxurious"];
    return aff[affordability.index];
  }
  // print(complexity);
  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/meal-detail', arguments: id);
  }
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(
                      imageUrl,
                    height: 250,
                    width: double.infinity ,
                    fit: BoxFit.cover,
                  ),

                ),
                Positioned(
                  bottom: 20 ,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(title, style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
