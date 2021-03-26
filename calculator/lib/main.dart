import "package:flutter/material.dart";

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
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

  var num1=0, num2=0, res=0;

  final TextEditingController t1 = TextEditingController(text: "0");

  final TextEditingController t2 = TextEditingController(text: "0");

  void doAddition()
  {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1+num2;
    });
  }

  void doSub()
  {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1-num2;
    });
  }

  void doMul()
  {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1*num2;
    });
  }

  void doDiv()
  {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1~/num2;
    });
  }

  void doClear()
  {
    setState(() {
      t1.text="0";
      t2.text="0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Output : $res",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number"),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number"),
              controller: t2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                      "+",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: doAddition,
                ),
                MaterialButton(
                  child: Text(
                      "-",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                  color: Colors.redAccent,
                  onPressed: doSub,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                      "*",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: doMul,
                ),
                MaterialButton(
                  child: Text(
                      "/",
                  style: TextStyle(
                    color: Colors.white
                  )
                  ),
                  color: Colors.redAccent,
                  onPressed: doDiv,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text("Clear", style: TextStyle(color: Colors.white),),
                  color: Colors.redAccent,
                  onPressed: doClear,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

