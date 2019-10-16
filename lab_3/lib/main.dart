import 'package:flutter/material.dart';
import 'package:coffee_store_app/widget/StoreHomePage.dart';
import 'package:coffee_store_app/widget/tabbed_page_demo_1.dart';
import 'package:coffee_store_app/widget/tabbed_page_demo_2.dart';
import 'package:coffee_store_app/widget/tabbed_page_demo_3.dart';
import 'package:coffee_store_app/widget/scoped_model_demo_1.dart';

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
      //home: MySecondTabbedPage(),
      //home: MyThirdTabbedPage(),
      //home: MyFirstScopedModelPage(),
      home: StoreHomePage(title: 'Store Home'),
    );
  }
}
