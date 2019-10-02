import 'package:flutter/material.dart';

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = '';
  String _msg2 = '';

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        return () {
          setState(() {
            _timesClicked++;
            _msg1 = 'Clicked $_timesClicked';
            print('clicked $_timesClicked');
          });
        };
      } else {
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        return () {
          setState(() {
            _timesClicked = 0;
            _msg1 = 'Click Me';
            print('Reset Pressed');
          });
        };
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool value) {
                      setState(() {
                        _enabled = value;
                        if (_enabled) {
                          _msg1 = 'Click Me';
                          _msg2 = 'Reset';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.blue,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed2(),
                    child: Text(_msg2),
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
