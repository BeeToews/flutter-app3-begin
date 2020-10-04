import 'package:flutter/material.dart';

// This app does
void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Dynamic ListView Builder Demo"),
          ),
          body: Column(
            children: <Widget>[
              TextField(
                controller: eCtrl,
                onSubmitted: (text) {
                  litems.add(text);
                  eCtrl.clear();
                  setState(() {});
                },
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Text(litems[index]);
                      }))
            ],
          )),
    );
  }
}
