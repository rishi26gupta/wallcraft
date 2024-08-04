import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/page9.dart';

class DisplayScreen extends StatelessWidget {
  final String query;
  DisplayScreen({required this.query, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 22, 72),
        title: const Text(
          "Wallpaper App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Page9(
        query: query,
      ),
    );
  }
}
