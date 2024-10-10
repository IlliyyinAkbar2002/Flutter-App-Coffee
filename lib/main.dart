import 'package:flutter/material.dart';
// import 'layout.dart';
import 'pages/offerspage.dart';
import 'pages/home.dart';
import 'pages/orderpages.dart';
import 'pages/menupage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentWidgetPage = const Text("!!!!!!!!!!!!");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('images/logo.png'),
          backgroundColor: Colors.brown,
        ),
        backgroundColor: const Color.fromARGB(
            255, 220, 196, 188), // Set the background color of the Scaffold
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Add this line
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            backgroundColor: Colors.brown,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.coffee),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.coffee_maker_sharp),
                label: 'Menu',
              )
            ]),
        body: switch (selectedIndex) {
          0 => const Home(),
          1 => const OffersPage(),
          2 => const OrderPages(),
          3 => const MenuPage(
              products: [],
            ),
          _ => currentWidgetPage,
        },
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
