import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    Widget buildContainer (title){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      );
    }

    Widget buildLists (child){
      return Container(
          height: 150,
          width: 300,
          padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15)),
      child: child,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: Column(
        children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              )),
          buildContainer('Ingredient'),
        buildLists(
            ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.yellow,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: selectMeal.ingredients.length,
            ),
          ),
          buildContainer('Steps'),
          buildLists(
            ListView.builder(itemBuilder: (ctx,index){
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectMeal.steps[index]),

                  ),
                  Divider(),
                ],
              );
            },itemCount: selectMeal.steps.length,)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
