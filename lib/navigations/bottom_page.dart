import 'package:adiletproj/navigation_pages/qr_page.dart';
import 'package:flutter/material.dart';
import '../navigation_pages/main_page_bot.dart';
import '../navigation_pages/map_page.dart';


class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int pageIndex = 0;
  final pages = [
    MainPageBot(),
    QrPage(),
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.qr_code_2_rounded,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.map_rounded,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}