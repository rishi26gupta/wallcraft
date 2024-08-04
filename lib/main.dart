import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper.dart';
import 'package:wallpaper_app/home_page.dart';
import 'package:wallpaper_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  Helper helper = new Helper();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
