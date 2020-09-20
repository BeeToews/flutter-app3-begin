import 'dart:math';

import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
// using the row and column widgets
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Row and Column Widgets"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Center(
                    child: Text(
                      'Container 1',
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 4,
                  origin: Offset(-50, -50),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Container 2',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: 150.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Container 3',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Container 4',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 200.0,
                  //height: double.infinity,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Center(
                    child: Text(
                      'Container 5',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 120,
                    //height: 20.0,
                    //height: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.red,
                    ),
                    //width: double.infinity,
                    child: Text(
                      'Container 6',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
