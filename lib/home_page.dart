import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/pages/page1.dart';
import 'package:wallpaper_app/pages/page2.dart';
import 'package:wallpaper_app/pages/page3.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryColor = Color.fromARGB(255, 153, 22, 72);

  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        title: Text(
          "WallCraft",
          style: GoogleFonts.pacifico(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              letterSpacing: 3,
              color: Colors.grey.shade100),
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: pageIndex == 0
                    ? Colors.black.withOpacity(.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  pageIndex = 0;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: pageIndex == 1
                    ? Colors.black.withOpacity(.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  pageIndex = 1;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.category,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: pageIndex == 2
                    ? Colors.black.withOpacity(.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  pageIndex = 2;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
