import 'package:flutter/material.dart';
import 'package:mobile_smile_multifab/screens/home_screen.dart'; // Sesuaikan dengan nama package kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smile Multifab',
      home: const HomeScreen(),
    );
  }
}