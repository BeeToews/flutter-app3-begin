import 'package:flutter/material.dart';
import 'package:coffee_store_app/widget/StoreHomePage.dart';
import 'package:coffee_store_app/widget/tabbed_page_demo_one.dart';
import 'package:coffee_store_app/widget/tabbed_page_demo_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyFirstTabbedPage(),
      home: AppBarBottomSample(),
      //home: StoreHomePage(title: 'Store Home'),
    );
  }
}
