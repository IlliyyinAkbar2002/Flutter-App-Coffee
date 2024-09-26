import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World!');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bannerTheme: Colors.blue,
      ),
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        // theme: ThemeData(primaryColor: Colors.blue),
        body: const Center(
          child: HelloWorld(),
        ),
      ),
    );
  }
}
