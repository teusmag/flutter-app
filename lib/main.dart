import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const THGestaoContabilApp());
}

class THGestaoContabilApp extends StatelessWidget {
  const THGestaoContabilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TH Gestão Contábil',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
