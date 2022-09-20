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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Текст слева по центру',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Hello Flutter',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Hello Flutter from metanit.com',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              color: Colors.green,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Вот мысль, которой весь я продан',
                      textDirection: TextDirection.ltr),
                  Text('Итог всего что ум скопил',
                      textDirection: TextDirection.ltr),
                  Text('Лишь тот, кем бой за жизнь изведан',
                      textDirection: TextDirection.ltr),
                  Text('Жизнь и свободу заслужил',
                      textDirection: TextDirection.ltr)
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.green,
              child: Row(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Tom', textDirection: TextDirection.ltr),
                  Text('Bob', textDirection: TextDirection.ltr),
                  Text('Sam', textDirection: TextDirection.ltr),
                  Text('Alice', textDirection: TextDirection.ltr)
                ],
              ),
            ),
            SizedBox(height: 50),

            Container(
              padding: EdgeInsets.all(30),
              color: Colors.green,
              child: Row(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: [
                  Expanded(
                      child: Text(
                    'Через несколько дней после отьезда Анатолия,Пьер получил записку от князя Андрея,извещавшего его о своем приезде и просившего Пьера заехать к нему',
                    textDirection: TextDirection.ltr,
                  ))
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              child: Stack(
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.lightGreen,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.greenAccent,),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: Image.network("https://i.pinimg.com/236x/d4/19/10/d419103b5efef5e67d27da4c8efc46a4.jpg"),
            ),

            Container(
              child: Image.asset("assets/images/1387398754_921856097.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}

