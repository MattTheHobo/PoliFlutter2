import 'package:flutter/material.dart';
import 'package:poli_flutter2/ComboCount.dart';

class SlideCount extends StatefulWidget {
  @override
  State<SlideCount> createState() => _SlideCount();
}

class _SlideCount extends State<SlideCount> {
  double _counter = 0.0, _multiplier = 1.0;

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
        title: Text(
            "Poli Counter") /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))*/,
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
                const Text("Multiplier:"),
                Slider(
                    value: _multiplier,
                    max: 20,
                    divisions: 20,
                    label: _multiplier.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _multiplier = value;
                        value != 0 ? _multiplier = value : _multiplier = 1.0;
                        print(_multiplier);
                        _counter = 0.0;
                      });
                    })
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
                                builder: ((context) => ComboCount())));
                      },
                      child: Text("ComboBox"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
