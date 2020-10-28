import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  String genders = "";
  int age = 0;
  double result = 0.0;
  double hume = 0.0;
  double james = 0.0;
  double boar = 0.0;
  double boarFat = 0.0;
  double jamesFat = 0.0;
  double humeFat = 0.0;
  String bmi;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean Body Mass Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lean Body Mass Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Lean Body Mass (Metric)',
                style: new TextStyle(
                    color: Colors.lightBlue.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Height(cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _heightcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Weight(kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _weightcontroller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              RaisedButton(
                child: Text("Male"),
                onPressed: _onPress1,
              ),
              RaisedButton(
                child: Text("Female"),
                onPressed: _onPress2,
              ),
            ]),
            RaisedButton(
              child: Text("Clear"),
              onPressed: _clear,
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: Table(
                    border: TableBorder.all(color: Colors.blue),
                    children: [
                      TableRow(children: [
                        Text('Formula'),
                        Text('Lean Body Mass'),
                        Text('Body Fat %'),
                      ]),
                      TableRow(children: [
                        Text('Boar'),
                        Text(boar.toStringAsFixed(2) + 'kg'),
                        Text(boarFat.toStringAsFixed(2) + 'kg'),
                      ]),
                      TableRow(children: [
                        Text('James'),
                        Text(james.toStringAsFixed(2) + 'kg'),
                        Text(jamesFat.toStringAsFixed(2) + 'kg'),
                      ]),
                      TableRow(children: [
                        Text('Hume'),
                        Text(hume.toStringAsFixed(2) + 'kg'),
                        Text(humeFat.toStringAsFixed(2) + 'kg'),
                      ]),
                    ]))
          ],
        ),
      ),
    );
  }

  void _onPress1() {
    //Male
    setState(() {
      double height = double.parse(_heightcontroller.text);
      double weight = double.parse(_weightcontroller.text);

      boar = 0.407 * weight + 0.267 * height - 19.2;
      boarFat = boar / weight * 100 - weight;
      james = 1.1 * weight - 128 * weight / height * weight / height;
      jamesFat = james / weight * 100 - weight;
      hume = 0.3281 * weight + 0.33929 * height - 29.5336;
      humeFat = hume / weight * 100 - weight;
      //result = (weight * weight) / height;
      //bmi = format(result);
    });
  }

  void _onPress2() {
    // Female
    setState(() {
      double height = double.parse(_heightcontroller.text);
      double weight = double.parse(_weightcontroller.text);

      boar = 0.252 * weight + 0.473 * height - 48.3;
      boarFat = boar / weight * 100 - weight;
      james = 1.07 * weight - 148 * weight / height * weight / height;
      jamesFat = james / weight * 100 - weight;
      hume = 0.29569 * weight + 0.41813 * height - 43.2933;
      humeFat = hume / weight * 100 - weight;
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  void _clear() {
    _weightcontroller.clear();
    _heightcontroller.clear();
  }
}
