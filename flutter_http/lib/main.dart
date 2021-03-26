import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http ;
import 'dart:convert' as JSON;

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url="https://jsonplaceholder.typicode.com/albums/";
  List<dynamic> data;

  @override
  void initState()
  {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var res = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept":"application/json"}
    );

    print(res.body);

    setState(() {
      Map<String, dynamic> convertJSONtoData = JSON.jsonDecode(res.body);
      data=convertJSONtoData[0];
    });

    return "Success";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve  Json via HTTP Get"),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 :  data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Container(
                        child: Text(data[index]["id"]),
                        padding: EdgeInsets.all(20.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}

