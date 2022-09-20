import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => SingleChildScrollViewTestRoute();
}

class SingleChildScrollViewTestRoute extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: TextField(decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.login),
            hintText: "Введите логи",
            helperText: 'Логин используется для входа в систему'
        ),),
        appBar: AppBar(title: Text("Metanit.ru"),),
      ),);
  }
}