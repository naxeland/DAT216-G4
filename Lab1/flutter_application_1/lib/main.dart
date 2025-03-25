import 'package:flutter/material.dart';
import 'package:lab1/pages/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the app.
  @override
  Widget build(BuildContext context) {
    // Use a MaterialApp as the skeleton
    // for the app.
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      // The starting page of the app
      home: const MainView(),
    );
  }
}
