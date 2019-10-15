import 'package:lab_3/widget/DrinksCarousel.dart';
import 'package:lab_3/widget/DrinksList.dart';
import 'package:flutter/material.dart';

class StoreHomePage extends StatelessWidget {

  final String title;

  const StoreHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          DrinksCarousel(),
          DrinksList(),
        ],
      ),
    );
  }
}
