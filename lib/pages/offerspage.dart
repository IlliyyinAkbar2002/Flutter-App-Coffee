import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width > 500) {
      return const Wrap(
        children: [
          Offer(
            title: 'Coffee Master',
            description: 'Description 1',
          ),
          Offer(
            title: 'Coffee Intermediate',
            description: 'Description 2',
          ),
          Offer(
            title: 'Coffee Beginner',
            description: 'Description 3',
          ),
          Offer(
            title: 'Coffee Beginner',
            description: 'Description 3',
          ),
        ],
      );
    } else if (size.width > 300) {
      return ListView(
        children: const [
          Offer(
            title: 'Coffee Master',
            description: 'Description 1',
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;
  const Offer({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Card(
        color: Colors.amberAccent.shade400,
        elevation: 10,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber.shade50,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                      selectionColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber.shade50,
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
