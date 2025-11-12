import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const FlutterCampusFeedback());
}

class FlutterCampusFeedback extends StatelessWidget {
  const FlutterCampusFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Feedback',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}
