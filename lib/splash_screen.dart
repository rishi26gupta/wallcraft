import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 2, 49),
      body: Center(
        child: Text(
          "WallCraft",
          style: GoogleFonts.pacifico(
              // decoration: TextDecoration.underline,
              decorationThickness: 2,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              letterSpacing: 3,
              color: Colors.grey.shade100),
        ),
      ),
    );
  }
}
