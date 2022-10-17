import 'package:adiletproj/user.dart';
import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key, required User usersInfo}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hello.jpeg"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
