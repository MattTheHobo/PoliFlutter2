import 'package:flutter/material.dart';
import 'package:poli_flutter2/SlideCount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0.0, _multiplier = 1.0;
  bool _isSwitched1 = false, _isSwitched2 = false;

  void _incrementCounter() {
    setState(() {
      if (_counter < (500 * _multiplier)) {
        _counter = _counter + (1 * _multiplier);
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter = _counter - (1 * _multiplier);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poli Counter")
        /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))*/,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              "Value:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _counter.round().toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Slider(
              value: _counter,
              max: 500 * _multiplier,
              divisions: 500,
              label: _counter.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _counter = value;
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("x2"),
                    Switch(
                        value: _isSwitched1,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched1 = value;
                            _isSwitched2 = false;
                            _counter = 0.0;
                            value ? _multiplier = 2.0 : _multiplier = 1.0;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("x5"),
                    Switch(
                        value: _isSwitched2,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched2 = value;
                            _isSwitched1 = false;
                            _counter = 0.0;
                            value ? _multiplier = 5.0 : _multiplier = 1.0;

                            /*if (value) {
                              multiplier = 5.0;
                            } else {
                              multiplier = 1.0;
                            }*/
                          });
                        })
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: _decrementCounter,
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 40),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        fixedSize: Size(150, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        fixedSize: Size(150, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 18, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: ((context) => SlideCount())));
                    }, 
                    child: Text("With Slider"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),)
              ],)
          ],
        ),
      ),
    );
  }
}
