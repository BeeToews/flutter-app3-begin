//This app demonstrates the TabController,
//TabBar, and TabBarView Widgets.
//When we use the TabController we have to initialize
//early in the lifecycle of the Stateful widget.
//The app also uses the List.map().toList() methods
//to convert a simple list into TabBar and TabView
//widgets.
//It also shows the use of mixins, but we will talk
//about that later.

//lifecycle explained from flutter community.
//https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

import 'package:flutter/material.dart';

class MyTabbedApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed Demo 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySecondTabbedPage(),
    );
  }
}

class MySecondTabbedPage extends StatefulWidget {
  @override
  _MySecondTabbedPageState createState() => _MySecondTabbedPageState();
}

class _MySecondTabbedPageState extends State<MySecondTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs.map((Tab tab) {
            return Text(
              tab.text,
              style: TextStyle(fontSize: 36),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}
