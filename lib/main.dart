import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  // State Variable
  var name = "";
  var age = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello $name! My age is $age'),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name",
            ),
            onChanged: (value) => setState(() => name = value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your age',
            ),
            onChanged: (value) => setState(() => age = value),
          ),
        )
      ],
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
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
