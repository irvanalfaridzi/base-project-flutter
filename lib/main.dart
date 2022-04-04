import 'package:base_project/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Project',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SplashPage(),
    );
  }
}
