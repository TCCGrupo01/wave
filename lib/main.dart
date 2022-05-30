import 'package:flutter/material.dart';
import 'package:wave/views/home_view.dart';
import 'package:wave/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromARGB(255, 229, 229, 229)),
      routes: {
        '/': (context) => const MainViewPage(),
        '/home': (context) => const MyHomePage(),
      },
    );
  }
}
