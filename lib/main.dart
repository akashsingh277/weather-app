import 'package:flutter/material.dart';

import 'pages/weatherpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: 
      WeatherPage(),
    );
  }
}