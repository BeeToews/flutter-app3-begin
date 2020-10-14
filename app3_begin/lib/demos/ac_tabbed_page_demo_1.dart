//This app demonstrates the DefaultTabController,
//TabBar, and TabBarView Widgets.

//DefualtTabController, TabBar, and TabBarView Widgets of the week.
//https://www.youtube.com/watch?v=POtoEH-5l40&vl=en

import 'package:flutter/material.dart';

class MyTabbedApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed Demo 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstTabbedPage(),
    );
  }
}

class MyFirstTabbedPage extends StatefulWidget {
  @override
  _MyFirstTabbedPageState createState() => _MyFirstTabbedPageState();
}

class _MyFirstTabbedPageState extends State<MyFirstTabbedPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            //The tabs property must be a list<Tab>.
            tabs: [
              Tab(text: "Car"),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(text: "Bike"),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          //However many list elements are in the TabBar
          //you must have exactly the same amount in the TabBarView.
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
