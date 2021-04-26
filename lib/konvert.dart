import 'package:flutter/material.dart';

class Konvert extends StatelessWidget {
  Function konvertHandler;
  Konvert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(
          "Konversi Suhu",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
