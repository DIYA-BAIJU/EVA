import 'package:flutter/material.dart';
import 'submain_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVA',
      theme: ThemeData(brightness: Brightness.dark),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class SubPage extends StatelessWidget {
//   const SubPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//     );
//   }
// }
