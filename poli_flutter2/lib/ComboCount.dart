import 'package:flutter/material.dart';

class ComboCount extends StatefulWidget {
  @override
  State<ComboCount> createState() => _ComboCount();
}

class _ComboCount extends State<ComboCount> {
  double _counter = 0.0, _multiplier = 1.0;
  double divider = 50.0;

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
                DropdownButton<double>(
                    value: _multiplier,
                    items: <double>[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
                        .map<DropdownMenuItem<double>>((double value) {
                      return DropdownMenuItem<double>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (double? newValue) {
                      setState(() {
                        _multiplier = newValue!;
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
          ],
        ),
      ),
    );
  }
}
