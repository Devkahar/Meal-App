import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilter;
  const FilterScreen({Key? key, required this.saveFilter}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluttenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function onChange) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: (newValue) => onChange(newValue),
    );
  }
  @override
  void initialState(){
    this.initialState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter Page'),
          actions: [
            IconButton(onPressed: () {
              final data = {
                'gluten': _gluttenFree,
                'lacose': _lactoseFree,
                'vegan': _vegan,
                'vegetarina': _vegetarian,
              };
                  widget.saveFilter(data);
            }, icon: Icon(Icons.save)),
          ],
        ),
        drawer: MainDrawer(),

        body: Column(children: [
          Container(
            child: Text(
              'Adjust Your meal Section',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(children: [
            _buildSwitchListTile(
                'Gluten-Free', 'Only Include Gluten Free Meals. ', _gluttenFree,
                (newVal) {
              setState(() {
                _gluttenFree = newVal;
              });
            }),
            _buildSwitchListTile('Lactose-Free',
                'Only Include Lactose  Free Meals. ', _lactoseFree, (newVal) {
              setState(() {
                _lactoseFree = newVal;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only Include Vegetarian Meals. ', _vegetarian,
                (newVal) {
              setState(() {
                _vegetarian = newVal;
              });
            }),
            _buildSwitchListTile('Vegan', 'Only Include Vegan Meals. ', _vegan,
                (newVal) {
              setState(() {
                _vegan = newVal;
              });
            })
          ])),
        ])
    );
  }
}
