import 'package:flutter/material.dart';
import 'package:flutter_application_1/datamodel.dart';
import '../datamanager.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  // final List<Product> products;

  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: dataManager.getMenu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Products Available'));
        } else {
          var product = snapshot.data![0].products[0];
          var product2 = snapshot.data![0].products[1];
          return ListView(
            children: [
              MenuItem(product: product, onAdd: () {}),
              MenuItem(product: product2, onAdd: () {}),
            ],
          );
        }
      },
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
