import 'package:lab3/widget/DrinksCarousel.dart';
import 'package:lab3/widget/DrinksList.dart';
import 'package:lab3/model/DrinksListModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class MyAppLab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreHomePage(title: 'Store Home'),
    );
  }
}

class StoreHomePage extends StatelessWidget {
  final String title;

  const StoreHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrinksListModel>(
      model: DrinksListModel(),
      child: Scaffold(
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
      ),
    );
  }
}