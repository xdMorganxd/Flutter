import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text("Hello World"),),
        body: Center(
            child: Column(
              children: [
                SizedBox(height: 100,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        primary: Colors.grey,
                        fixedSize: Size(100, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){}, child:Text("кнопка") ),
                SizedBox(height: 70,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        primary: Colors.grey,
                        fixedSize: Size(120, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){}, child:Text("кнопка") ),
                SizedBox(height: 70,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        primary: Colors.grey,
                        fixedSize: Size(150, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){}, child:Text("кнопка") ),

              ],
            )
        ),
      ),
    );
  }
}