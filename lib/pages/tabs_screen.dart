import 'package:flutter/material.dart';
import '../pages/categories_screen.dart';
import '../pages/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _pageIndex = 0;

  final titles = ['Categories', 'Your Favorites'];

  void _selectPage(index) {
    setState(() {
      _pageIndex = index;
    });

    print('_pageIndex: $_pageIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[_pageIndex],
        ),
        //title: Text(_pages[_pageIndex]['title'] as String),
      ),
      body: IndexedStack(
        index: _pageIndex,
        children: const [
          CategorieScreen(),
          FavouriteScreen(),
        ],
      ),
      //body: _pages[_pageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.favorite),
              label: 'Favourite')
        ],
      ),
    );
  }
}
