import 'package:bitctoin_ticker/views/screens/home_screen.dart';
import 'package:bitctoin_ticker/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF240d40),
        primaryColor: const Color(0xFF76106a),
      ),
      home: const SplashScreen(),
    );
  }
}
