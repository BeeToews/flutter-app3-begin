//This app demonstrates the DefaultTabController,
//TabBar, and TabBarView Widgets.
//Also how to pass parms down the stateful widget tree.

//DefualtTabController, TabBar, and TabBarView Widgets of the week.
//https://www.youtube.com/watch?v=POtoEH-5l40&vl=en

import 'package:flutter/material.dart';

class MyFirstTabbedPage extends StatefulWidget {
  MyFirstTabbedPage({this.title, this.color});

  final String title;
  final Color color;

  @override
  _MyFirstTabbedPageState createState() => _MyFirstTabbedPageState();
}

class _MyFirstTabbedPageState extends State<MyFirstTabbedPage> {
  @override
  Widget build(BuildContext context) {
    String myTitle = widget.title;
    Color myColor = widget.color;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: myColor,
        appBar: AppBar(
          title: Text(myTitle),
          bottom: TabBar(
            indicatorColor: Colors.white,
            //The tabs property must be a list<Tab>.
            tabs: [
              Tab(text: "Car"),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(text: "Bike"),
            ],
          ),
        ),
        body: TabBarView(
          //However many list elements are in the TabBar
          //you must have exactly the same amount in the TabBarView.
          children: [
            Icon(
              Icons.directions_car,
              color: Colors.white,
              size: 100,
            ),
            Icon(
              Icons.directions_transit,
              color: Colors.white,
              size: 100,
            ),
            Icon(
              Icons.directions_bike,
              color: Colors.white,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
