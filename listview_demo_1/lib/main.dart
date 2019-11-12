import 'package:flutter/material.dart';

// This app does
void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return MaterialApp(
          home: new Scaffold(
        appBar: new AppBar(title: new Text("Dynamic ListView Builder Demo"),),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
              child: new ListView.builder
                (
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Text(litems[index]);
                  }
              )
          )
          ],
        )
      ),
    );
  }
}