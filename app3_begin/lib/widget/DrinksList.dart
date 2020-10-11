import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:flutter/material.dart';

class DrinksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(6.0),
        //We transform the coffeTypes list into a new
        //list of DrinksCards using the List.map().toList()
        //method calls from the List class.
        children: coffeeTypes.map((e) {
          return DrinksCard(
            drinkType: e,
          );
        }).toList(),
      ),
    );
  }
}
