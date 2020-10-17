import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_counters.dart';
import 'widget1.dart';
import 'widget2.dart';
import 'widget3.dart';

class MyHomePage extends StatelessWidget {
  final MyScopedCounter myScopedCounter = MyScopedCounter();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyScopedCounter>(
      model: myScopedCounter,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello World with Scoped Model'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Widget1(),
              Widget2(),
              Widget3(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => myScopedCounter.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
