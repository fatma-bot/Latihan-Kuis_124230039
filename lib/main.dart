import 'package:flutter/material.dart';
import 'package:latiankuis/screens/loginpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

// git init
// git remote add origin https//
// git add .
// git commit -m "first commit"
// git push -u origin main
