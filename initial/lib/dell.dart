import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          n = 10;
          setState(() {});
          print(n);
        },
        child: const Icon(Icons.add));
  }
}
