import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_smile_multifab/screens/main_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smile Multifab',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFA0007)),
        useMaterial3: true,
      ),
      
      home: const MainWrapper(),
    );
  }
}