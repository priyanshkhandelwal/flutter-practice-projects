import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String mytext = "hello World";

  void _changeText()
  {
    setState(() {
      if(mytext.startsWith("h")){
        mytext="Hello Statefull Widget";
    }
      else{
        mytext="hello World";
      }
    }
      );
  }

  Widget _bodywidget()
  {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                mytext
            ),
            RaisedButton(
              child: Text(
                  "Click To See",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: _changeText,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stateful Widget"
        ),
      ),
      body: _bodywidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeText,
        child: Icon(
          Icons.add
        ),
      ),
      );
  }
}


