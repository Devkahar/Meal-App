

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    Widget buildListTile(String title,IconData icon,String path){
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: (){
            Navigator.of(context).pushReplacementNamed(path);
        },
      );
    }
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.yellow,
              child: Center(
                child: Text('Cooking Up!',style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
                ),
              ),
            ),
            buildListTile('Meals',Icons.restaurant,'/'),
            buildListTile('Filters',Icons.settings,'/filter'),
          ],
        ),

      ),
    );
  }
}
