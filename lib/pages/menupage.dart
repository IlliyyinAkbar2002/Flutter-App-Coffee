import 'package:flutter/material.dart';
import 'package:flutter_application_1/datamodel.dart';

class MenuPage extends StatelessWidget {
  final List<Product> products;

  const MenuPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // Example: Display the first product
    var product = products.isNotEmpty
        ? products[0]
        : Product(
            id: 0, name: "No Product", price: 0, image: "black_coffee.png");
    var product2 = products.isNotEmpty
        ? products[1]
        : Product(
            id: 0, name: "No Product", price: 0, image: "black_coffee.png");
    return ListView(
      children: [
        MenuItem(product: product, onAdd: () {}),
        MenuItem(product: product2, onAdd: () {}),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const MenuItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Image.asset("images/${product.image}", fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("\$${product.price.toStringAsFixed(2)}"),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: const Text("Add"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
