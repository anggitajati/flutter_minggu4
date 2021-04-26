import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_minggu4/hasil.dart';
import 'package:flutter_minggu4/konvert.dart';
import 'input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController input = new TextEditingController();

  double _celcius = 0;
  double _kelvin = 0;
  double _reamor = 0;
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _hasil = 0;
  void _konversiSuhu() {
    setState(() {
      _celcius = double.parse(input.text);
      if (_newValue == "Kelvin")
        _hasil = _celcius + 273;
      else
        _hasil = (4 / 5) * _celcius;
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      _konversiSuhu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etCelcius: input),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
                onTap: _konversiSuhu,
              ),
              Hasil(result: _hasil),
              Konvert(konvertHandler: _konversiSuhu),
              Container(
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Expanded(child: ListView())
            ],
          ),
        ),
      ),
    );
  }
}
