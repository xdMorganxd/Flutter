import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Container Example"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              new BoxShadow(
                color: Colors.blueAccent,
                offset: new Offset(6, 6),
              ),
            ],
          ),
          child: Text(
              "Привет Мир!",
              style: TextStyle(fontSize: 25,color: Colors.orange)),
        ),
      ),
    );
  }
}