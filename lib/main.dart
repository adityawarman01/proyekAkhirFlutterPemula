import 'package:flutter/material.dart';
import 'package:palembang_mobile/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Wisata di Kota Palembang',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}

  



